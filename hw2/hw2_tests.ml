open Hw2;;

(* merge_int_lists: int list -> int list -> int list *)
assert((merge_int_lists [1; 2; 3] []) = [1; 2; 3]);;
assert((merge_int_lists [] [1; 2; 3]) = [1; 2; 3]);;
assert((merge_int_lists [1; 3] [2]) = [1; 2; 3]);;

(* merge_string_lists *)
assert((merge_string_lists ["a"; "c"] ["b"]) = ["a"; "b"; "c"]);;

(* merge_name_lists *)
let name1 = {fname="A"; sname="B"};;
let name2 = {fname="A"; sname="C"};;
let name3 = {fname="B"; sname="A"};;

assert((merge_name_lists [name1; name3] [name2] ) = [name1; name2; name3]);;

(* len : 'a list -> int *)
assert( len [1] = 1 );;

(* forall : ('a -> bool) -> 'a list -> bool *)

assert( (forall (fun x -> x > 0) [-1]) = false);;
assert( (forall (fun x -> x > 0) [1]) = true);;

(* exists : ('a -> bool) -> 'a list -> bool *)

assert( (exists (fun x -> x > 0) [-1]) = false);;
assert( (exists (fun x -> x > 0) [1; -1]) = true);;

(* typecheck : expr -> Typ *)

let e1 = BinOp(Add, ConstI 42, ConstI 43);;
let e2 = Let("x", ConstI 42, Var "x");;
let e3 = Let("foo",
            Fun("x", TypI, BinOp(Mult, Var("x"), Var("x"))),
            Call("foo", ConstI 3));;
let e4 = BinOp(Mult, ConstI 42, Var "x");;
let e5 = If(ConstB true, ConstB true, ConstB false);;
let e6 = If(ConstI 42, ConstB true, ConstB false);;

assert( typecheck(e1) = TypI );;
assert( typecheck(e2) = TypI );;
assert( typecheck(e3) = TypI );;

assert(try ignore((typecheck e4)); false with
        | UndefinedVariable v -> (v = "x")
        | _ -> false);;

assert( typecheck(e5) = TypB );;

assert(try ignore((typecheck e6)); false with
        | TypeError -> true
        | _ -> false);;