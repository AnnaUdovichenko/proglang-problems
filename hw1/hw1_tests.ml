open Hw1;;

(* is_positive: int list -> bool *)
assert(is_positive [] = true);;
assert(is_positive [4] = true);;
assert(is_positive [4; -1] = false);;


(* is_sorted: int list -> bool *)
assert(is_sorted [] = true);;
assert(is_sorted [4] = true);;
assert(is_sorted [4; -1] = false);;

 
(*count_branches: int_tree -> int *)
assert(count_branches Lf = 0);;
assert(count_branches (Br(1, Lf, Lf)) = 1);;

(* depth: int_tree -> int *)
assert(depth Lf = 0);;
assert(depth (Br(1, Lf, Lf)) = 1);;


(* gen_tree: int -> int_tree *)
assert(gen_tree 0 = Lf);;
assert(gen_tree 1 = Br(1, Lf, Lf));;

(* inorder: int_tree -> int list *)
assert(inorder(Br(1, Lf, Lf))  = [1]);;

(* preorder: int_tree -> int list *)
assert(preorder(Br(1, Lf, Lf))  = [1]);;


(* search_book: key -> book_type list -> book_type list *)
assert(search_book "hello" [] = []);;

(* simplify: bool_expr - > bool_expr *)
assert(simplyfy(Const(True)) = Const(True));;
assert(simplyfy(And(Const(True), Const(False))) = Const(False));;

(* lookup: string -> (string * letlang_expr) list -> letlang_expr option *)

assert((lookup "x" []) = None);;
assert((lookup "x" [("x", Const 15)]) = Some (Const 15));;
assert((lookup "x" [("x", Const 15); ("x", Const 14)]) = Some (Const 15));;

(* eval: letlang_expr -> letlang_expr *)

let e1 = Const 42;;
let e2 = Var "x";;
let e3 = Let("y", Const 15, Var "y");;
let e4 = Let("y", Const 15, Let("y", Const 14, Var "y"));;

assert((eval e1) = (Const 42));;
assert(try ignore((eval e2)); false with
        | UndefinedVariable v -> (v = "x")
        | _ -> false);;

assert((eval e3) = Const(15));;
assert((eval e4) = Const(14));;


Printf.printf "All Tests passed!\n"
