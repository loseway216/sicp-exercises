#lang sicp
; 实现flat

(define (fringe list)
  (define (iter first result)
    (cond
      [(null? first) result]
      [(not (pair? first)) (cons first result)]
      [else (iter (car first) (iter (cdr first) result))]))
  (iter list nil))

; test
(define x (list (list 1 2) (list 3 4)))

(fringe x) ; (1 2 3 4)

(fringe (list x x)) ; (1 2 3 4 1 2 3 4)
