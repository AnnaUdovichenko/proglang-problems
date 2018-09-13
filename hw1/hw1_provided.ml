

type int_tree = Lf | Br of int * int_tree * int_tree


type author_type = {fname: string; sname: string}
type book_type = {author: author_type; name: string; year: int}


type const = True | False
type bool_expr =
 | Const of const
 | Var of string
 | Not of bool_expr
 | And of bool_expr * bool_expr
 | Or of bool_expr * bool_expr

exception UndefinedVariable of string

type letlang_expr = 
  Const of int
  | Var of string
  | Let of string * letlang_expr * letlang_expr

