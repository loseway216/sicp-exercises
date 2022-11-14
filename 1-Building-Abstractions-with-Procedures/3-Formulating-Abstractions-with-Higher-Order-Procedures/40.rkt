#lang sicp
; 定义cubic 返回的是procedure

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))