#lang sicp
; rewrite reverse

(define (reverse sequence)
  (fold-right (lambda (current acc) (append acc (list current))) nil sequence))

(define (reverse2 sequence)
  (fold-left (lambda (current acc) (cons acc current)) nil sequence))

; fold-right === accumulate
(define (fold-right op initial sequence)
  (if (null? sequence) initial (op (car sequence) (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) result (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(reverse (list 1 2 3 4))
(reverse2 (list 1 2 3 4))
