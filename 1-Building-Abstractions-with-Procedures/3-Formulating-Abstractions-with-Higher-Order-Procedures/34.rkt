#lang sicp

(define (f g)
  (g 2))

; f接受的参数是procedure而不是2
(f f)
