#lang sicp
; 打印线段的中心点坐标 嵌套了两层数据结构

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment line-segment)
  (car line-segment))

(define (end-segment line-segment)
  (cdr line-segment))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (average a b)
  (/ (+ a b) 2.0))

(define (midpoint-segment line-segment)
  (let ([start-point (start-segment line-segment)] [end-point (end-segment line-segment)])
    (make-point (average (x-point start-point) (x-point end-point))
                (average (y-point start-point) (y-point end-point)))))

; test
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))))
