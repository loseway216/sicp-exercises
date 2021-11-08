#lang sicp
; 牛顿法求平方根
(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average (/ x guess) guess))

; 数字太小导致误差太大
; 数字太大导致一直执行good-enough
; (define (good-enough? guess x)
;   (< (abs (- x (square guess))) 0.001))

; 让机器自己达到极限
(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(square (sqrt 0.0009))
