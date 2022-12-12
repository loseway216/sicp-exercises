#lang sicp

(define (stream-limit s tolerance)
  (let ([s0 (stream-ref s 0)] [s1 (stream-ref s 1)])
    (if (< (abs (- s0 s1)) tolerance) s1 (stream-limit (stream-cdr s) tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (stream-ref s n)
  (if (= n 0) (stream-car s) (stream-ref (stream-cdr s) (- n 1))))

(define (sqrt-stream x)
  (define guesses (cons-stream 1.0 (stream-map (lambda (guess) (sqrt-improve guess x)) guesses)))
  guesses)

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s)) (stream-map proc (stream-cdr s)))))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

; test
(sqrt 2 00.1)
