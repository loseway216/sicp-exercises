#lang sicp
; new-if不能代替if，因为function evaluates all arguments
; procedure遵循applicative-order
(define (new-if predicate then-clause else-clause)
  (cond
    [predicate then-clause]
    [else else-clause]))

(new-if (= 2 3) 0 5)

(define (p)
  (p))

; 死循环
(new-if (= 2 2) 0 (p))

; if没问题 因为函数会计算参数
(if (= 2 2) 0 (p))
