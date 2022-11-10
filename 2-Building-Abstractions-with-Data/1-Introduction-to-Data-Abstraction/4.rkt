#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 1 2))
; (car (lambda (m) (m x y)))
; (lambda ((lambda (p q) p)) ((lambda (p q) p) x y))
; (x y ) x
