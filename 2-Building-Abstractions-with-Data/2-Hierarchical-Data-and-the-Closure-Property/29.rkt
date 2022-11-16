#lang sicp
; 联系嵌套的数据结构

(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (cond
    [(null? mobile) 0]
    [(not (pair? mobile)) mobile]
    [else
     (+ (total-weight (branch-structure (left-branch mobile)))
        (total-weight (branch-structure (right-branch mobile))))]))

(define (balanced mobile)
  (let ([top-left-branch (left-branch mobile)] [top-right-branch (right-branch mobile)])
    (= (* (branch-length top-left-branch) (total-weight (branch-structure top-left-branch)))
       (* (branch-length top-right-branch) (total-weight (branch-structure top-right-branch))))))
; test
(define m
  (make-mobile (make-branch 3 7) (make-branch 3 (make-mobile (make-branch 1 3) (make-branch 3 4)))))

(total-weight m)
(balanced m)
