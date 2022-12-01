#lang sicp
; inear time and constant space

(define (is-cycle? list)
  (define (safe-cdr l)
    (if (pair? l) (cdr l) '()))
  (define (iter a b)
    (cond
      [(null? a) #f]
      [(null? b) #f]
      [(eq? a b) #t]
      [else (iter (safe-cdr a) (safe-cdr (safe-cdr b)))]))
  (iter (safe-cdr list) (safe-cdr (safe-cdr list))))

; test
(define x '(1 2 3 4 5 6 7 8))
(define y '(1 2 3 4 5 6 7 8))
(set-cdr! (cdddr (cddddr y)) (cdddr y))
(define z '(1))
(set-cdr! z z)
x ; (1 2 3 4 5 6 7 8)
y ; (1 2 3 . #0=(4 5 6 7 8 . #0#))
z ; #0=(1 . #0#)
(is-cycle? x) ; #f
(is-cycle? y) ; #t
(is-cycle? z) ; #t
