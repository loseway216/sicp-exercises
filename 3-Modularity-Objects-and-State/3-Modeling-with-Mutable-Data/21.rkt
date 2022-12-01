#lang sicp

(define (print-queue q)
  (display (car q)))

; test
(define (make-queue)
  (cons '() '()))

(define (insert-queue! queue item)
  (let ([new-pair (cons item '())])
    (cond
      [(empty-queue? queue)
       (set-front-ptr! queue new-pair)
       (set-rear-ptr! queue new-pair)
       queue]
      [else
       (set-cdr! (rear-ptr queue) new-pair)
       (set-rear-ptr! queue new-pair)
       queue])))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (front-ptr queue)
  (car queue))
(define (rear-ptr queue)
  (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define q1 (make-queue))

(insert-queue! q1 'a)
; ((a) a)

(insert-queue! q1 'b)
; ((a b) b)

(insert-queue! q1 'c)
; ((a b c) c)

(print-queue q1)
; (a b c)
