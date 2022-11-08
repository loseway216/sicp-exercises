#lang sicp
;写一个时间O(logn)的乘法

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

; (define (* a b)
;   (if (= b 0) 0 (+ a (* a (- b 1)))))

; linear recursive
(define (* a b)
  (cond
    [(= b 0) 0]
    [(even? b) (double (* a (halve b)))]
    [else (+ a (* a (- b 1)))]))

; test
(* 2 4)
(* 4 0)
(* 5 1)
(* 7 10)
