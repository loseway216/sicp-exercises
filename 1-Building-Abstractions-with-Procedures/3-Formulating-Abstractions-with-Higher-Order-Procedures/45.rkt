#lang sicp
; 结合前面的方法，计算x的n次方，并且测试需要average-damp多少次
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (cond
      [(= n 0) x]
      [else ((compose f (repeated f (- n 1))) x)])))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ([next (f guess)]) (if (close-enough? guess next) next (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond
    [(= n 0) a]
    [(even? n) (fast-expt-iter (square b) (/ n 2) a)]
    [else (fast-expt-iter b (- n 1) (* a b))]))

; 以上都是前面的方法
(define (nth-roots x n times)
  (fixed-point ((repeated average-damp times) (lambda (y) (/ x (fast-expt y (- n 1))))) 1.0))

(nth-roots 4 2 1)
(nth-roots 8 3 1)
(nth-roots 16 4 2)
