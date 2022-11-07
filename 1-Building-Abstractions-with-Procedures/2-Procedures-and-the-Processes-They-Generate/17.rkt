#lang sicp
;写一个log steps的乘法

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

; iterative recursive
; 利用一个中间值叠加暂存a的值，枚举几个例子更容易理解
(define (fast-multi a b)
  (fast-multi-iter a b 0))

(define (fast-multi-iter a b helper)
  (cond
    [(= b 0) helper]
    [(even? b) (fast-multi-iter (double a) (halve b) helper)]
    [else (fast-multi-iter a (- b 1) (+ a helper))]))

; test
(* 2 4)
(* 4 0)
(* 5 1)
(* 7 10)

(fast-multi 2 4)
(fast-multi 4 0)
(fast-multi 5 1)
(fast-multi 7 10)
