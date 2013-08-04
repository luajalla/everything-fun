// Microsoft.Z3.dll, config and libz3.dylib are in the script's folder
#r "Microsoft.Z3.dll"

open System
open Microsoft.Z3
open Microsoft.FSharp.Quotations
open DerivedPatterns
open Patterns

let prove (ctx: Context) f =
    let s = ctx.MkSolver()
    s.Assert (ctx.MkNot f)
    match s.Check() with
    | Status.UNKNOWN -> printfn "unknown because %A" s.ReasonUnknown
    | Status.SATISFIABLE -> printfn "error"
    | _ -> printfn "ok, proof: %A" s.Proof

/// Prove that x = y implies g(x) = g(y)  
let proveSample() =  
    let prms = System.Collections.Generic.Dictionary (dict [ "proof", "true" ])
    let ctx = new Context(prms)

    // create uninterpreted type
    let U = ctx.MkUninterpretedSort (ctx.MkSymbol "U")
    // declare function g
    let g = ctx.MkFuncDecl("g", U, U)

    // create x and y
    let x = ctx.MkConst("x", U)
    let y = ctx.MkConst("y", U)
    // create g(x), g(y)
    let gx = g.[x]
    let gy = g.[y]

    // assert x = y
    let eq = ctx.MkEq(x, y)

    // prove g(x) = g(y)
    let f = ctx.MkEq(gx, gy)
    printfn "prove: x = y implies g(x) = g(y)"
    prove ctx (ctx.MkImplies(eq, f))

proveSample()    




/// Simplified SpecificCall
let inline (|Func|_|) expr =
    match expr with
    | Lambdas(_,(Call(_,minfo1,_))) -> function
        | Call(obj, minfo2, args) when minfo1.MetadataToken = minfo2.MetadataToken ->
            Some args
        | _ -> None
    | _ -> failwith "invalid template parameter"

let z3 expr =
    let prms = System.Collections.Generic.Dictionary (dict [ "proof", "true" ])
    let ctx = new Context()
      
    let rec unquote expr =
        match expr with
        | Func <@@ (+) @@> [x; y] -> ctx.MkAdd (unquote x, unquote y)
        | Func <@@ (-) @@> [x; y] -> ctx.MkSub (unquote x, unquote y)
        | Lambdas (_, e) -> unquote e
        | Var var -> ctx.MkIntConst var.Name :> ArithExpr
        | x -> failwith (sprintf "unknown expression %A" x)
    unquote expr

/// Simplify expression "x + (y - (x + z))"
let simplifier() =
    let t1 = z3 <@@ fun x y z -> x + (y - (x + z)) @@>  
    let t2 = t1.Simplify()
    printfn "%A -> %A" t1 t2


simplifier()
