#lang sicp

; A function f is defined by the rule that f(n)=n if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3.

; recursive process
(define (f n)
  (if (< n 3) n (+ (+ (f (- n 1)) (* 2 (f (- n 2)))) (* 3 (f (- n 3))))))

; iterative process
(define (f2 n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (cond
    [(= count 0) c]
    [else (f-iter (+ (+ a (* b 2)) (* c 3)) a b (- count 1))]))

(f 20)
(f2 20)
