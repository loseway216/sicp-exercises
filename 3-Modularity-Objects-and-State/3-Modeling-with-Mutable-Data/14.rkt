#lang sicp
; reverse
; 但改变原数据

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ([temp (cdr x)])
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

; test
(define v (list 'a 'b 'c 'd))

(define w (mystery v))

w
