#lang sicp
; 哈夫曼树encode

(define (encode message tree)
  (if (null? message) '() (append (encode-symbol (car message) tree) (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      (if (eq? symbol (symbol-leaf tree)) '() (error "missing symbol:" symbol))
      (let ([left (left-branch tree)] [right (right-branch tree)])
        (if (eqOrContain symbol left)
            (cons 0 (encode-symbol symbol left))
            (cons 1 (encode-symbol symbol right))))))

(define (eqOrContain symbol tree)
  (if (leaf? tree) (equal? symbol (symbol-leaf tree)) (element-of-set symbol (symbols tree))))

(define (element-of-set x set)
  (cond
    [(null? set) false]
    [(equal? x (car set)) true]
    [else (element-of-set x (cdr set))]))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf leaf)
  (cadr leaf))

(define (weight-leaf leaf)
  (caddr leaf))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

; 合并两个leaf或tree的字母
; generic procedure
(define (symbols tree)
  (if (leaf? tree) (list (symbol-leaf tree)) (caddr tree)))

(define (weight tree)
  (if (leaf? tree) (weight-leaf tree) (cadddr tree)))

; (left right {A,B,C} weight)
(define (make-code-tree left right)
  (list left right (append (symbols left) (symbols right)) (+ (weight left) (weight right))))

; test
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1) (make-leaf 'C 1)))))

(define sample-message '(A D A B B C A))

(encode sample-message sample-tree)
