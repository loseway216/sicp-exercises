#lang sicp
; 用递归和map实现遍历操作list元素

(define (square x)
  (* x x))

(define (square-tree tree)
  (cond
    [(null? tree) nil]
    [(not (pair? tree)) (square tree)]
    [else (cons (square-tree (car tree)) (square-tree (cdr tree)))]))

(define (square-tree-map tree)
  (map (lambda (sub-tree) (if (pair? sub-tree) (square-tree-map sub-tree) (square sub-tree))) tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))) ; (1 (4 (9 16) 25) (36 49))
(square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))) ; (1 (4 (9 16) 25) (36 49))
