#lang sicp
; 基于42的compose

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (cond
      [(= n 0) x]
      [else ((compose f (repeated f (- n 1))) x)])))

; test
(define (square x)
  (* x x))

((repeated square 2) 5)
