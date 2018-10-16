
type name = {fname: string; sname: string}

type typ =
  | TypI (* int *)
  | TypB (* bool *)
  | TypF of typ * typ (* function: T1 -> T2 *);;


type op = Add | Mult | Eq | Less;;

type expr =
  | ConstI of int
  | ConstB of bool
  | Var of string
  | BinOp of op * expr * expr (* Operation type, first subexpression, second subexpression *)
  | Let of string * expr * expr (* var name, expression to bind, let body *)
  | Fun of string * typ * expr (* parameter name, parameter type, function body *)
  | Call of string * expr (* function name, argument expression *)
  | If of expr * expr * expr (* Text expression, then branch, else branch *);;

exception UndefinedVariable of string;;
exception TypeError;;
