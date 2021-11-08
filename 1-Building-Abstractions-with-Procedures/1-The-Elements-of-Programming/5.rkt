#lang sicp
(define (p)
  (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; 分析 normal-order vs applicative-order
; normal-order p不会被执行
; applicative-order p执行然后死循环
