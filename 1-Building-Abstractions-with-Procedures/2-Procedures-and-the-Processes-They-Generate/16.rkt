#lang sicp
; 写出一个时间空间O(logn)的iterative的b的n次方算法

; 给定条件
; (b的n/2次方)2次方=(b的2次方)n/2次方
; a * b的n次方是不变的

(define (even? n)
  (= (remainder n 2) 0))

(define (square a)
  (* a a))

; 最基础的线性递归 时间空间O(n)
(define (expt b n)
  (cond
    [(= n 0) 1]
    [else (* b (expt b (- n 1)))]))

; 线性迭代 时间O(n) 空间O(1)
(define (expt2 b n)
  (expt2-iter b n 1))

(define (expt2-iter b n a)
  (cond
    [(= n 0) a]
    [else (expt2-iter b (- n 1) (* a b))]))

; 优化的线性递归 时间空间O(logn)
(define (fast-expt3 b n)
  (cond
    [(= n 0) 1]
    [(even? n) (square (fast-expt3 b (/ n 2)))]
    [else (* b (fast-expt3 b (- n 1)))]))

; 优化的线性迭代 时间O(logn) 空间O(1)
(define (fast-expt4 b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond
    [(= n 0) a]
    [(even? n) (fast-expt-iter (square b) (/ n 2) a)]
    [else (fast-expt-iter b (- n 1) (* a b))]))

; test
(expt 2 8)
(expt2 2 8)
(fast-expt3 2 8)
(fast-expt4 2 8)
