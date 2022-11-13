#lang sicp

(define nil '())

(define (reverse items)
  (define (iter i result)
    (if (null? i) result (iter (cdr i) (cons (car i) result))))
  (iter items nil))

(reverse (list 23 72 149 34))
