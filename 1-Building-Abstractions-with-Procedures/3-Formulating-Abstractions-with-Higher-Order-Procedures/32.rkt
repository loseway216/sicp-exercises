#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

; test
(define (factorial a)
  (define (term x)
    x)
  (define (next x)
    (+ x 1))
  (product term 1 next a))

(factorial 5)
