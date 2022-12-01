#lang sicp
; 跟17的思路一样用一个中间值

(define (is-cycle? list)
  (let ([cache nil])
    (define (iter x)
      (set! cache (cons x cache))
      (cond
        [(null? (cdr x)) #f]
        [(memq x cache) true]
        [else (iter (cdr x))]))
    (iter list)))

; test
(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(is-cycle? z)
