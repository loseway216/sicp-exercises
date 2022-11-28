#lang sicp

(define make-monitored
  (let ([counter 0])
    (lambda (f)
      (lambda (input)
        (cond
          [(eq? input 'how-many-calls?) counter]
          [(eq? input 'reset-count) (set! counter 0)]
          [else
           (set! counter (+ counter 1))
           (f input)])))))

; test
(define s (make-monitored sqrt))

(s 100)

(s 9)

(s 'how-many-calls?)
