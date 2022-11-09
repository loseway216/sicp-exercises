#lang sicp

(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (cond
      [(= n 0) x]
      [else ((compose f (repeated f (- n 1))) x)])))

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  (lambda (x) ((repeated smooth n) x)))
