#lang sicp
; 拆分set
; 用第一个元素跟后面所有元素的subset组合

; subset(2,3) + map(1, subset(2,3))
; subset(3) + map(2, subset(3)) + map(1, subset(3) + map(2, subset(3)))
; subset() + map(3, subset()) + map(2, subset() + map(3, subset())) + map(1, subset() + map(3, subset()) + map(2, subset() + map(3, subset())))
; () + map(3, ()) + map(2, () + map(3, ())) + map(1, () + map(3, ()) + map(2, () + map(3, ())))
; () + (3) + map(2, () + (3)) + map(1, () + (3) + map(2, () + (3)))
; () + (3) + (map(2, () + (3))) + map(1, () + (3) + map(2, () + (3)))
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ([rest (subsets (cdr s))]) (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; test
(subsets (list 1 2 3)) ; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
