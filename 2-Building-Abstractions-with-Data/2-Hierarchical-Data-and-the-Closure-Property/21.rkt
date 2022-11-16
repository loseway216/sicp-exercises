#lang sicp
; 用递归和map实现遍历操作list元素

(define (square-list items)
  (if (null? items) nil (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4))
(square-list2 (list 1 2 3 4 5))
