#lang sicp
; message passing风格的make-queue
; 用local state 存住头尾指针

(define (make-queue)
  (let ([front-ptr '()] [rear-ptr '()])
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?) (error "FRONT called with an
              empty queue") (car (front-ptr))))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (insert-queue! item)
      (let ([new-pair (cons item '())])
        (cond
          [(empty-queue?)
           (set-front-ptr! new-pair)
           (set-rear-ptr! new-pair)]
          [else
           (set-cdr! rear-ptr new-pair)
           (set-rear-ptr! new-pair)])))
    (define (delete-queue!)
      (cond
        [(empty-queue?) (error "delete called with empty queue")]
        [else (set-front-ptr! (cdr front-ptr))]))
    (define (print-queue)
      front-ptr)
    (define (dispatch m)
      (cond
        [(eq? m 'empty-queue?) empty-queue?]
        [(eq? m 'front-queue) front-queue]
        [(eq? m 'insert-queue!) insert-queue!]
        [(eq? m 'delete-queue!) delete-queue!]
        [(eq? m 'print-queue) print-queue]
        [else (error "undefined operations")]))
    dispatch))

; test
(define q (make-queue))
(q 'empty-queue?) ; #t
((q 'insert-queue!) 'a) ; ((a) a)
(q 'empty-queue?) ; #f
((q 'insert-queue!) 'b) ; ((a b) b)

(q 'delete-queue!) ; ((b) b)
(q 'delete-queue!) ; (())

(q 'print-queue)
