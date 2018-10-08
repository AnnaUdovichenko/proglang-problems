#lang racket

(define x 3)
(define y (+ x 2))

(define cube ; function
  (lambda (x)
    (* x (* x x))
    ))

; Recursive function with if clause
(define pow
  (lambda (x y)
    (if (= y 0)
        1
        (* x (pow (- y 1)))
        )))

(if (< x 8)
    1
    "Hi")


; Curried pow
(define pow-curry
  (lambda (x)
    (lambda (y)
      (if (= y 0)
          1
          (* x ((pow-curry x) (- y 1)))))))

(define three-to-the (pow-curry 3))
(define eightyone (three-to-the 4))
(define sixteen ((pow-curry 2) 4))


; Lists
(define lst (cons 2 (cons 3 null)))

(cdr lst)
(car lst)
(null? lst)

(list 1 2 3)

; List processing function samples

(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))

(define (append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (append (cdr xs) ys))))

(define (map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (map f (cdr xs)))))


; Heterogenous lists
(list #t "Hi" (list 1 3 4))

(define (sum-all xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum-all (cdr xs)))
          (+ (sum-all (car xs)) (sum-all (cdr xs))))))


; cond

(define (sum-cond xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum-cond (cdr xs)))]
        [#t (+ (sum-cond (car xs)) (sum-cond (cdr xs)))]))

; tasks

; Uncomment and run tests


;(require rackunit)

;(define tests
;  (test-suite
;   "Sample tests"
;    ; sequence test
;   (check-equal? (sequence 0 5 1) (list 0 1 2 3 4 5) "Sequence test")
;
;   ; string-append-map test
;   (check-equal? (string-append-map 
;                  (list "foo" "bar") 
;                  ".rkt") '("foo.rkt" "bar.rkt") "string-append-map test")
;
;   ; sum-indifferent test
;   (check-equal? (sum-indifferent (list 3 2)) 5 "sum-indifferent test")
;   (check-equal? (sum-indifferent (list "Hi" (list 2))) 2 "sum-indifferent test")
;
;   ; flatten test
;   (check-equal? (flatten (list null)) null "flatten test")
;   (check-equal? (flatten (list 1 2 (list 3))) (list 1 2 3) "flatten test")
;
;   ;; duplicate test
;   (check-equal? (duplicate (list 1)) (list 1 1) "duplicate test")
;   (check-equal? (duplicate (list 1 2)) (list 1 1 2 2) "duplicate test")
;))

; (require rackunit/text-ui)
;; runs the test
;(run-tests tests)