#lang racket

;; Some trivial tests are allredy done for you. You should add more tests here.
;; Although tests won't be graded, make sure that you solution is tested well.

(require "hw3.rkt")
(require rackunit)

;; Helper functions
(define ones (lambda () (cons 1 ones)))

(define tests
  (test-suite
   "Sample tests for HW3"
   
   ; list-nth-mod test
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 2) 2 "list-nth-mod test")
   
   ; stream-for-n-steps test
   (check-equal? (stream-for-n-steps (lambda () (cons 1 ones)) 1) (list 1) "stream-for-n-steps test")

   ; stream-map test
   (check-equal? (stream-for-n-steps (stream-map ones (lambda (x) (+ x 1))) 2) (list 2 2) "stream-map test")

   ; combine-stream test
   (check-equal? (stream-for-n-steps (combine-streams ones ones +) 2) (list 2 2) "combine-streams test")

   ; skip-first-n test
   (check-equal? (stream-for-n-steps (skip-first-n ones 1) 1) (list 1) "skip-first-n test")
      
   ; funny-number-stream test
   (check-equal? (stream-for-n-steps funny-number-stream 16) (list 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15 16) "funny-number-stream test")
   (check-equal? (stream-for-n-steps (skip-first-n funny-number-stream 5) 3) (list 6 7 8) "funny-number-stream and skip-first-n test")

   ; squares test
   (check-equal? (stream-for-n-steps (squares ones) 3) (list 1 1 1) "squares test")
   
   ; taylor test
   (check-= 0.095 (apply + (stream-for-n-steps (taylor 0.1) 10)) 0.005 "taylor test")
   
   ; cycle-lists test
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 3) (list (cons 1 "a") (cons 2 "b") (cons 3 "a")) 
                 "cycle-lists test")

   ; stairs test
   (check-equal? (stairs 4) 7 "stairs test")

   ; stairs2 test
   (check-equal? (stairs2 4 0) 5 "stairs2 test")
   (check-equal? (stairs2 4 1) 7 "stairs2 test")
     
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
