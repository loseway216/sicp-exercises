#lang sicp
; 分析结果

(define (stream-filter pred stream)
  (cond
    [(stream-null? stream) the-empty-stream]
    [(pred (stream-car stream))
     (cons-stream (stream-car stream) (stream-filter pred (stream-cdr stream)))]
    [else (stream-filter pred (stream-cdr stream))]))

(define sum 0)
;; sum => 0

(define (accum x)
  (set! sum (+ x sum))
  sum)
;; sum => 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;; sum => 1

(define y (stream-filter even? seq))
;; sum => 6

(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
;; sum => 10

(stream-ref y 7)
;; sum => 136
;; => 136

(display-stream z)
;; sum => 210
;; => (10 15 45 55 105 120 190 210)
