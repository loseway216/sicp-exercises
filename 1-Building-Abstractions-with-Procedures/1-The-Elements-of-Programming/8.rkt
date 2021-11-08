#lang sicp
; 牛顿法求立方根
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (cube-root-iter guess x)
  (if (good-enough? guess x) guess (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  ; guess=1 y=-2 会导致 0/3
  (cube-root-iter 1.1 x))

(cube-root 8)
(cube-root 27)
(cube-root -2)
