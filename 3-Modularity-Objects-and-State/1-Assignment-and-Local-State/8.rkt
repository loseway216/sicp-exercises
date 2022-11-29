#lang sicp
; 因为有赋值 所以执行顺序有影响

(define f
  (let ([init 1])
    (lambda (x)
      (set! init (- x init))
      (- x init))))

; test
(+ (f 0) (f 1))

(+ (f 1) (f 0))
