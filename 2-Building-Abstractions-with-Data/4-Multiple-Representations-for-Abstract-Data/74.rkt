#lang sicp

(define (attach-tag type-tag content)
  (cons type-tag content))

(define (get-record division employee-name)
  ((get division 'get-record) employee-name))

(define (get-salary division employee-name)
  ((get division 'get-salary) employee-name))

(define (find-employee-record employee-name division-list)
  (if (null? division-list)
      #f
      ((get-record (car division-list) employee-name)
       (find-employee-record employee-name (cdr division-list)))))
