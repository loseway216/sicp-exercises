#lang sicp
; 正确版本的count-pairs

(define (count-pairs x)
  (let ([cache nil])
    (define (helper x)
      (if (or (not (pair? x)) (memq x cache))
          0
          (begin
            (set! cache (cons x cache))
            (+ (helper (car x)) (helper (cdr x)) 1))))
    (helper x)))

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
