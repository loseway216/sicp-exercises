#lang sicp

(define (last-pair items)
  (define (iter i)
    (if (null? (cdr i)) i (iter (cdr i))))
  (iter items))

(last-pair (list 23 72 149 34))
