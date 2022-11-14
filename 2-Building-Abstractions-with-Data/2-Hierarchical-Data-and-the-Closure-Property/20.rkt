#lang sicp

(define (same-parity first . rest)
  (define (ok? x)
    (if (even? first) (even? x) (odd? x)))
  (define (iter list result)
    (if (null? list) result (iter (cdr list) (if (ok? (car list)) (cons result (car list)) result))))
  (iter rest (list first)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
