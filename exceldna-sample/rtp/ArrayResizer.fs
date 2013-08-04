namespace rtp

open ExcelDna.Integration

// Define AddIn to use ExcelAsyncUtil
type RExcelAddIn() =
    interface IExcelAddIn with
        member x.AutoOpen() = ExcelAsyncUtil.Initialize()
        member x.AutoClose() = ExcelAsyncUtil.Uninitialize()
 
[<AutoOpen>]
module ArrayResizer =
    open System
    open System.Collections.Generic

    // XlCall with a single parameter, the output is ignored     
    let inline private xlCall xlFunction (param: obj) =
        XlCall.Excel(xlFunction, param) |> ignore

    // original C# version is here: http://exceldna.codeplex.com/
    let private doResize (target: ExcelReference) =
        try
            xlCall XlCall.xlcEcho false

            // Get the formula in the first cell of the target
            let formula = XlCall.Excel(XlCall.xlfGetCell, 41, target) |> string
            let firstCell = new ExcelReference(target.RowFirst, target.RowFirst, target.ColumnFirst, target.ColumnFirst, target.SheetId)
            let isFormulaArray: bool = XlCall.Excel(XlCall.xlfGetCell, 49, target) |> unbox

            if isFormulaArray then
                let oldSelectionOnActiveSheet = XlCall.Excel XlCall.xlfSelection
                let oldActiveCell = XlCall.Excel XlCall.xlfActiveCell

                // Remember old selection and select the first cell of the target
                let firstCellSheet = XlCall.Excel(XlCall.xlSheetNm, firstCell) |> string
                xlCall XlCall.xlcWorkbookSelect [| firstCellSheet |]

                let oldSelectionOnArraySheet = XlCall.Excel XlCall.xlfSelection
                xlCall XlCall.xlcFormulaGoto firstCell

                // Extend the selection to the whole array and clear
                xlCall XlCall.xlcSelectSpecial 6
                let oldArray = XlCall.Excel XlCall.xlfSelection :?> ExcelReference
                oldArray.SetValue ExcelEmpty.Value |> ignore
                xlCall XlCall.xlcSelect oldSelectionOnArraySheet
                xlCall XlCall.xlcFormulaGoto oldSelectionOnActiveSheet
            
            // Get the formula and convert to R1C1 mode
            let isR1C1Mode: bool = XlCall.Excel(XlCall.xlfGetWorkspace, 4) |> unbox
            let formulaR1C1 = 
                if not isR1C1Mode then 
                    // Set the formula into the whole target
                    XlCall.Excel(XlCall.xlfFormulaConvert, formula, true, false, ExcelMissing.Value, firstCell) |> string
                else formula
            
            // Must be R1C1-style references
            let res = ref null
            let retval = XlCall.TryExcel(XlCall.xlcFormulaArray, res, formulaR1C1, target)

            if retval <>  XlCall.XlReturn.XlReturnSuccess then
                firstCell.SetValue("'" + formula) |> ignore
        finally 
            xlCall XlCall.xlcEcho true

    
    let resize (arr: obj[,]) =
        match XlCall.Excel XlCall.xlfCaller :?> ExcelReference with
        | null -> box arr
        | caller -> 
            let rows, cols = arr.GetLength 0, arr.GetLength 1

            let callerRows = caller.RowLast - caller.RowFirst + 1
            let callerCols = caller.ColumnLast - caller.ColumnFirst + 1
            if callerRows <> rows || callerCols <> cols then
                let eref = ExcelReference(caller.RowFirst, caller.RowFirst + rows - 1, caller.ColumnFirst, caller.ColumnFirst + cols - 1, caller.SheetId)
                ExcelAsyncUtil.QueueAsMacro (ExcelAction (fun () -> doResize eref))
                box ExcelError.ExcelErrorNA
            else
                box arr
