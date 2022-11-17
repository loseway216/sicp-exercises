#lang sicp
; O(n^2) union-set

(define (union-set set1 set2)
  (if (null? set1) set2 (union-set (cdr set1) (adjoin (car set1) set2))))

(define (adjoin x set)
  (if (element-of-set x set) set (cons x set)))

(define (element-of-set x set)
  (cond
    [(null? set) false]
    [(equal? x (car set)) true]
    [else (element-of-set x (cdr set))]))

(union-set (list 1 2 3) (list 3 4 5))
