#lang sicp
; 实现deep-reversesss

(define (reverse items)
  (define (iter list result)
    (if (null? list) result (iter (cdr list) (cons (car list) result))))
  (iter items nil))

(define (deep-reverse items)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (if (pair? (car list)) (deep-reverse (car list)) (car list)) result))))
  (iter items nil))

; test
(define x (list (list 1 2) (list 3 4)))

(reverse x) ; ((3 4) (1 2))

(deep-reverse x) ; ((4 3) (2 1))
