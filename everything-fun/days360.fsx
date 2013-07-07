open System

(*
//start date <= end date
type LTE = fun sy sm sd ey em ed =>
    ey > sy \/ (ey = sy /\ (em > sm \/ (em = sm /\ ed >= sd)))

logic val isValidDate: year -> month -> day -> bool
assume Valid: forall y m (d:day{m <> 2 \/ d < 30}). isValidDate y m d = true 
*)

// val lastDay: year -> month -> day -> bool -> bool

//EU 30/360: the last day of Feb is not changed to 30
let inline lastDay y m d eu =
    if eu && m = 2 then d = 30
    else d = DateTime.DaysInMonth(y, m)

let inline adjDay d last = if last then 30 else d

//val days360: sy:year -> sm:month -> sd:day{isValidDate sy sm sd = true}
//    -> ey:year -> em:month -> ed:day{isValidDate ey em ed = true /\ LTE sy sm sd ey em ed}
//    -> bool
//    -> int
let days360 sy sm sd ey em ed convEU =
    let slast, elast = lastDay sy sm sd convEU, lastDay ey em ed convEU

    //EU: 31 -> 30
    //US: 31 -> 30; end of Feb -> 30
    let sd = adjDay sd slast
    //EU: 31 -> 30
    //US: 31 -> 30 if sd is EOM; end of Feb -> 30 if sd was end of Feb too
    let ed = adjDay ed (elast && (convEU || (slast && (sm = 2 || em <> 2))))

    (ey - sy)*360 + (em - sm)*30 + (ed - sd)


// start date * end date * expected result (EU) * expected result (US)
let tests = [
    DateTime(2012,4,25), DateTime(2012,7,31), 95, 96
    DateTime(2012,5,31), DateTime(2012,7,31), 60, 60
    DateTime(2012,6,30), DateTime(2012,7,31), 30, 30
    DateTime(2012,2,28), DateTime(2012,3,31), 32, 33
    DateTime(2012,2,29), DateTime(2012,3,31), 31, 30
    DateTime(2012,2,29), DateTime(2013,2,28), 359, 360
    DateTime(2012,2,29), DateTime(2012,3,01), 2, 1 
    DateTime(2012,2,29), DateTime(2013,3,01), 362, 361
    DateTime(2012,3,01), DateTime(2013,3,01), 360, 360
    DateTime(2011,2,28), DateTime(2013,2,28), 720, 720
    DateTime(2013,1,31), DateTime(2013,2,28), 28, 28
]

let runTest (s: DateTime) (e: DateTime) eu exp =
    let res = days360 s.Year s.Month s.Day e.Year e.Month e.Day eu
    if res <> exp then printfn "%A-%A (%A): expected %d; got %d" s e eu exp res; false
    else true

tests |> Seq.forall (fun (s,e,expEU,expUS) ->
   runTest s e true expEU && runTest s e false expUS)

