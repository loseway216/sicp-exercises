#lang sicp

(define (make-rat n d)
  (let ([g ((if (< d 0) - +) (gcd n d))]) (cons (/ n g) (/ d g))))

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; Testing
(print-rat (make-rat 6 9)) ; 2/3
(print-rat (make-rat -6 9)) ; -2/3
(print-rat (make-rat 6 -9)) ; -2/3
(print-rat (make-rat -6 -9)) ; 2/3
