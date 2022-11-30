#lang sicp
; append和append!的区别
; append创建新list而不改变原数据
; append!改变原数据

(define (append x y)
  (if (null? x) y (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

; test
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
; (a b c d)

(cdr x)
; (b)

(define w (append! x y))

w
; (a b c d)

(cdr x)
; (b c d)
