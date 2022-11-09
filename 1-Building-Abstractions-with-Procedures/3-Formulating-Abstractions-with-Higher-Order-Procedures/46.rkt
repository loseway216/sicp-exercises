#lang sicp
; 定义一个通用的迭代优化方法，重写fixed-point和sqrt

; 接收2个procedure，返回参数为guess的procedure
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess) guess ((iterative-improve good-enough? improve) (improve guess)))))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve (lambda (x) (close-enough? x (f x))) f) first-guess))

; fixed-point计算黄金分割律
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (square x)
    (* x x))
  ((iterative-improve (lambda (y) (< (abs (- (square y) x)) 0.0001)) (lambda (y) (average y (/ x y))))
   1.0))

(sqrt 4)
