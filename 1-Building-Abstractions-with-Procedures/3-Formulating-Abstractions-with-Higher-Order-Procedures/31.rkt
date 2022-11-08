#lang sicp

(define (product term a next b)
  (if (> a b) 1 (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial a)
  (define (term x)
    x)
  (define (next x)
    (+ x 1))
  (product-iter term 1 next a))

(factorial 5)
