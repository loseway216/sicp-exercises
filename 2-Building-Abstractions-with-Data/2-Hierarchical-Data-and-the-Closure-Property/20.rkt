#lang sicp
; 根据第一个元素的奇偶过滤list

(define (same-parity first . rest)
  (define (ok? x)
    (if (even? first) (even? x) (odd? x)))
  (define (iter list result)
    (if (null? list)
        (reverse result)
        (iter (cdr list) (if (ok? (car list)) (cons (car list) result) result))))
  (iter rest (list first)))

(define (reverse items)
  (define (iter i result)
    (if (null? i) result (iter (cdr i) (cons (car i) result))))
  (iter items nil))

; test
(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
