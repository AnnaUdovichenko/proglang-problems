#lang racket

(provide (all-defined-out))

; Abstract syntax for a-lang

(struct avar (id) #:transparent)
(struct aint (value) #:transparent)
(struct abool (value) #:transparent)
(struct anil() #:transparent)
(struct asub (e1 e2) #:transparent)
(struct aless (e1 e2) #:transparent)
(struct afun (param body) #:transparent)
(struct aclosure (fun env) #:transparent)
(struct acall (e1 e2) #:transparent)
(struct alet (id e1 e2) #:transparent)
(struct apair (e1 e2) #:transparent)
(struct afst (e) #:transparent)
(struct asnd (e) #:transparent)
(struct isanil (e) #:transparent)
(struct aif (e1 e2 e3) #:transparent)

; A-lang evaluator code

(define (lookup-env env id)
  (cond [(null? env) (error "unbound variable during evaluation" id)]
        [(equal? (car (car env)) id) (cdr (car env))]
        [#t (lookup-env (cdr env) id)]
        ))

; Recursive helper function taking expression and environment

(define (eval-under-env expr env)
  (cond
    [(aint? expr) expr]
    [(asub? expr) 
     (let ([v1 (eval-under-env (asub-e1 expr) env)]
           [v2 (eval-under-env (asub-e2 expr) env)])
       (if (and (aint? v1) (aint? v2))
           (aint (- (aint-value v1) (aint-value v2)))
           (error (format "bad A-Lang expression: ~v" expr))))]
    ; Add code for remaining cases
      
    [#t (error (format "bad A-Lang expression: ~v" expr))]
    ))

(define (eval-expr expr)
  (eval-under-env expr null))

; Trying A-lang

(define a-zero (aint 0))
