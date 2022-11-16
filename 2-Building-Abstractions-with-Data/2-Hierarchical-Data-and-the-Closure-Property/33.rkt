#lang sicp
; 借助accumulate实现map append length
; 关键点在于搞明白op的两个参数的含义

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (current acc) (cons (p current) acc)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (current acc) (inc acc)) 0 sequence))

; test
(map inc (list 0 1 2 3))

(append (list 0 1) (list 2 3))

(length (list 0 1 2 3))
