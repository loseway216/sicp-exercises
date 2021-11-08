#lang sicp
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.
(define (square x)
  (* x x))

(define (sum-square x y)
  (+ (square x) (square y)))

(define (sum-square-large x y z)
  (cond
    [(and (>= (+ x y) (+ x z)) (>= (+ x y) (+ y z))) (sum-square x y)]
    [(and (>= (+ x z) (+ x y)) (>= (+ x z) (+ y z))) (sum-square x z)]
    [(and (>= (+ y z) (+ x z)) (>= (+ y z) (+ x y))) (sum-square y z)]))

(sum-square-large 1 2 3)
(sum-square-large 1 -2 3)
