#lang sicp
(define (double f)
  (lambda (x) (f (f x))))

; test
(((double (double double)) inc) 5)
