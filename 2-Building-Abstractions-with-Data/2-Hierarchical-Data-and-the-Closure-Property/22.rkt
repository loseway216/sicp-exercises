#lang sicp
; 用迭代递归优化21

(define (square x)
  (* x x))

; 结果是反的，跟20题是一样的，需要reverse
; (2 3 4) 1->nil
; (3 4) 2->1->nil
; (4) 3->2->1->nil
(define (square-list items)
  (define (iter things answer)
    (if (null? things) answer (iter (cdr things) (cons (square (car things)) answer))))
  (iter items nil))

; 结果是 (((1) 2) 3) 4)
; (cons answer (square (car things)))

(square-list (list 1 2 3 4))
