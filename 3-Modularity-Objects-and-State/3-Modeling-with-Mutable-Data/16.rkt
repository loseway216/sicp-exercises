#lang sicp
; 通过指向同一个list或者set-car重复计算count

(define (count-pairs x)
  (if (not (pair? x)) 0 (+ (count-pairs (car x)) (count-pairs (cdr x)) 1)))

; test
; 画图都是3对结构体
(count-pairs (list 'a 'b 'c))

(define second (cons 'a 'b))
(define third (cons 'a 'b))
(define first (cons second third))
(set-car! third second)
(count-pairs first) ;; => 4

(define x (cons 'a 'b))
(define y (cons x x))
(define z (cons y y))
(count-pairs z) ;; => 7

; (define lst (list 'a 'b 'c))
; (set-cdr! (cddr lst) lst)
; (count-pairs lst) ;; never returns
