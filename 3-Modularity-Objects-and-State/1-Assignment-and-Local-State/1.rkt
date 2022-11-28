#lang sicp

(define (make-accumulator sum)
  (lambda (x)
    (set! sum (+ sum x))
    sum))

; test
(define A (make-accumulator 5))

(A 5)

(A 10)
