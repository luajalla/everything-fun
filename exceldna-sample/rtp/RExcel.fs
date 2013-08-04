namespace rtp

module RExcel =
    open RProvider
    open RProvider.``base``
    open RProvider.randomForest

    open ExcelDna.Integration

    [<ExcelFunction(Name = "IMPORTANCE", Description = "Variable importance measures as produced by R's randomForest")>]
    let importance (names: obj[]) (values: float[,]) (ys: float[]) =
        let cols = min names.Length (values.GetLength 1)
        let rows = min ys.Length (values.GetLength 0)

        let xs = 
            names
            |> Seq.take cols
            |> Seq.mapi (fun j name ->
                string name, Array.init rows (fun i -> values.[i, j]))
            |> namedParams
            |> R.data_frame            

        let rf = R.randomForest(xs, ys)
        (R.importance rf).Value


    [<ExcelFunction(Name = "SMA", Description="Simple Moving Average")>]
    let sma (values: float[]) (nobj: float) =
        let n = int nobj
        let len = values.Length
        if len < n || n < 2 then box ExcelError.ExcelErrorNA
        else 
            let res = Array2D.zeroCreate len 1

            Seq.windowed n values
            |> Seq.map Seq.average
            |> Seq.iteri (fun i v -> res.[i+n-1, 0] <- box v)
            resize res
