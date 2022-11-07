#lang sicp
; Pascal’s triangle, tree recursive

;         1
;        1   1
;      1   2   1
;    1   3   3   1
;  1   4   6   4   1
;        . . .

(define (pascal row column)
  (cond
    [(or (= row 1) (= row 2) (= column 1) (= row column)) 1]
    [else (+ (pascal (- row 1) (- column 1)) (pascal (- row 1) column))]))

(pascal 1 1)
(pascal 2 2)
(pascal 3 2)
(pascal 4 2)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 6 4)
