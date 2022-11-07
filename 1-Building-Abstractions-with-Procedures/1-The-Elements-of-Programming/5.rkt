#lang sicp
; 分析 normal-order vs applicative-order
; normal-order 先展开再执行 p不会被执行
; applicative-order p执行 然后死循环

(define (p)
  (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
