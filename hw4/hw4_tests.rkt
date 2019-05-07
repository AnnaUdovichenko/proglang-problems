#lang racket

(require "hw4.rkt")

(require rackunit)

; Helper code

(define foo-code
  (alet "foo" (afun "x" (asub (avar "x") (aint 42)))
        (acall (avar "foo") (aint 43))))

(define if-code
  (alet "eq42" (afun "x" (aif (aless (avar "x") (aint 42))
                                (abool #f)
                                (aif (aless (aint 42) (avar "x")) (abool #f) (abool #t)))) (apair (acall (avar "eq42") (aint 42))(acall (avar "eq42") (aint 43)))))

(define (to-a-list lst)
  (if (null? lst)
      (anil)
      (apair (aint (car lst)) (to-a-list (cdr lst)))))

(define (from-a-list lst)
  (if (anil? lst)
      null
      (cons (aint-value (apair-e1 lst)) (from-a-list (apair-e2 lst)))))


; Sample tests
(define tests
  (test-suite
   "Sample tests for HW 4"
  
   (check-equal? (eval-expr (aint 2)) (aint 2) "dummy test")
   (check-equal? (eval-expr (asub (aint 42) (aint 2))) (aint 40) "sub test")
   (check-equal? (eval-expr (alet "x" (aint 2) (avar "x"))) (aint 2) "let-var test")
   (check-equal? (eval-expr (isanil (anil))) (abool #t) "nil test")
   (check-equal? (eval-expr (asnd (apair (aint 42) (anil)))) (anil) "pair test 1")
   (check-equal? (eval-expr (alet "p" (apair (aint 34) (aint 4)) (asub (afst (avar "p")) (asnd (avar "p"))))) (aint 30) "pair test 2")
   (check-equal? (eval-expr foo-code) (aint 1) "func test")
   (check-equal? (eval-expr if-code) (apair (abool #t) (abool #f)) "if test")

   (check-equal? (eval-expr (a-add (aint 42) (aint 43))) (aint 85) "a-add test")
   (check-equal? (eval-expr (a-eq (aint 42) (a-add (aint 20)(aint 22)))) (abool #t) "a-eq test 1")
   (check-equal? (eval-expr (a-eq (aint 43) (a-add (aint 20)(aint 22)))) (abool #f) "a-eq test 2")
   (check-equal? (eval-expr (a-mul (aint 1) (aint 0))) (aint 0) "a-mul test 1")
   (check-equal? (eval-expr (a-mul (aint 4) (aint 3))) (aint 12) "a-mul test 2")
   (check-equal? (eval-expr (acall a-sum (apair (aint 1) (apair (aint 2) (anil))))) (aint 3) "a-sum test")
   (check-equal? (from-a-list (eval-expr (acall map-squares (to-a-list '(1 2 3 4))))) '(1 4 9 16) "squares test")
   ))

(require rackunit/text-ui)
(run-tests tests)
