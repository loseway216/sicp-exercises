#lang sicp

(define (equal? list1 list2)
  (cond
    [(and (not (pair? list1)) (not (pair? list2))) (eq? list1 list2)] ; 都是symbol
    [(and (pair? list1) (pair? list2)) ; 都是list
     (and (equal? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))]
    [else false]))

; test
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6))

(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6))
