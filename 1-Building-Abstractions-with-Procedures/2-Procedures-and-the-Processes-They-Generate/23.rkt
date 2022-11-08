#lang sicp
; 优化最小除数

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    [(> (square test-divisor) n) n]
    [(divides? test-divisor n) test-divisor]
    [else (find-divisor n (next test-divisor))]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a)
  (* a a))

; 2,3,4,5,6优化成2,3,5,7,9
(define (next test-divisor)
  (if (= test-divisor 2) 3 (+ test-divisor 2)))

; test
; Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?
(smallest-divisor 1001)
(smallest-divisor 1003)
(smallest-divisor 1005)
(smallest-divisor 10001)
(smallest-divisor 10003)
(smallest-divisor 10005)
(smallest-divisor 100001)
(smallest-divisor 100003)
(smallest-divisor 100005)
(smallest-divisor 1000001)
(smallest-divisor 1000003)
(smallest-divisor 1000005)
