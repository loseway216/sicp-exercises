#lang sicp
(define (mystery a b)
  ((if (> b 0) + -) a b)
  ;改写
  ((if (> b 0) (+ a b) (- a b)))
  (+ a (if (> b 0) b (- b)))
  (+ a (abs b)))
