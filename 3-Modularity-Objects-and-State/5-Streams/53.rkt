#lang sicp
; 输出 1 2 4 8 16 ...

(define s (cons-stream 1 (add-streams s s)))
