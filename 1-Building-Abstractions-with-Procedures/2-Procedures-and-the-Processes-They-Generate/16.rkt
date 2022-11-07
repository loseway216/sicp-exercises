#lang sicp
; 写出一个时间空间O(logn)的iterative的b的n次方算法

; 给定条件
; (b的n/2次方)2次方=(b的2次方)n/2次方
; a * b的n次方是不变的

; 基于递归版本，写一个迭代的版本
; (define (fast-expt b n)
;   (cond
;     [(= n 0) 1]
;     [(even? n) (square (fast-expt b (/ n 2)))]
;     [else (* b (fast-expt b (- n 1)))]))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond
    [(= n 0) a]
    [(even? n) (fast-expt-iter (* b b) (/ n 2) a)]
    [else (fast-expt-iter b (- n 1) (* a b))]))

(fast-expt 2 8)
