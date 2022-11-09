#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

; test
(define (square x)
  (* x x))

((compose square inc) 6)
