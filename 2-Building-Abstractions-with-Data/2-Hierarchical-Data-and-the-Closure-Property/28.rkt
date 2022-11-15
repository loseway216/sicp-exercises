#lang sicp

(define nil '())

; (define (fringe list)
;   (if (null? list)
;       nil
;       (let ([first (car list)] [rest (cdr list)])
;         (if (not (pair? first)) (cons first (fringe rest)) (cons (fringe first) (fringe rest))))))

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
