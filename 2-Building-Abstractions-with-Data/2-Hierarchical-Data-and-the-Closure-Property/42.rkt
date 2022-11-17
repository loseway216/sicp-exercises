#lang sicp
; 八皇后之谜
; 处理嵌套mapping的典型案例

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

; col = 8
; (((1 8) . 1) ((2 8) . 1) ((3 8) . 1) ((4 8) . 1) ((5 8) . 1) ((6 8) . 1) ((7 8) . 1) ((8 8) . 1))
(define (adjoin-position row col rest-of-queens)
  (cons (list row col) rest-of-queens))

(define empty-board nil)

(define (enumerate-interval low high)
  (if (> low high) nil (cons low (enumerate-interval (+ low 1) high))))

; TODO: 烧脑
(define (safe? k positions)
  ())

(define (queen-in-k col positions)
  (cond
    [(null? positions) nil]
    [(= col (cadar positions)) (car positions)]
    [else (queen-in-k col (cdr positions))]))

; (map (lambda (new-row) (adjoin-position new-row 8 1)) (enumerate-interval 1 8))

(define (same-row queenA queenB)
  (= (car queenA) (car queenB)))

(define (same-left-diagonal queenA queenB)
  (= (+ (car queenA) (cadar queenA)) (+ (car queenB) (cadar queenB))))

(define (same-right-diagonal queenA queenB)
  (= (- (car queenA) (cadar queenA)) (- (car queenB) (cadar queenB))))

(define (filter proc sequence)
  (cond
    [(null? sequence) nil]
    [(proc (car sequence)) (cons (car sequence) (filter proc (cdr sequence)))]
    [else (filter proc (cdr sequence))]))
