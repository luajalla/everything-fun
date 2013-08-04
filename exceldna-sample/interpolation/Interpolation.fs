namespace Interpolation

open ExcelDna.Integration

[<AutoOpen>]
module Interpolation =

    let private interpolate curve (point: float) =
        let len = Array.length curve
        let u =
            if point < fst curve.[0] then 1
            elif point > fst curve.[len-1] then len-1
            else Array.findIndex (fun (v, _) -> point < v) curve
        let (xu, yu), (xd, yd) = curve.[u], curve.[u-1]
        let lnp = log yd + (log yu - log yd) / (xu - xd) * (point - xd)
        exp lnp

    [<ExcelFunction(Name="LOGLINEAR", Description="Log-Linear Interpolation", Category="Custom", IsThreadSafe = true)>]
    let loglinear (xs: _[]) (ys: _[]) points =
        let curve =
            Seq.zip xs ys
            |> Seq.distinctBy fst
            |> Seq.sort
            |> Seq.toArray

        if curve.Length < 2 then failwith "at least 2 points are required"
        Array.map (interpolate curve) points
