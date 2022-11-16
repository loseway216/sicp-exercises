#lang sicp
; redefine count-leaves

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond
    [(null? tree) nil]
    [(not (pair? tree)) (list tree)]
    [else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree)))]))

(define (count-leaves tree)
  (accumulate (lambda (current acc) (inc acc)) 0 (enumerate-tree tree)))

; (define (count-leaves x)
;   (cond
;     [(null? x) 0]
;     [(not (pair? x)) 1]
;     [else (+ (count-leaves (car x)) (count-leaves (cdr x)))]))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(count-leaves (list x x))
