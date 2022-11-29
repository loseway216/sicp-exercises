#lang sicp
; 创建银行账户+密码校验

(define (make-account balance password)
  (let ([couter 0])
    (define (withdraw amount)
      (if (>= balance amount)
          (begin
            (set! balance (- balance amount))
            balance)
          "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch p m)
      (cond
        [(> couter 7) (error "call the cops")]
        [(not (eq? password p))
         (set! couter (+ couter 1))
         (lambda (x) "incorrect password")]
        [(eq? m 'withdraw) withdraw]
        [(eq? m 'deposit) deposit]
        [else (error "Unknown request:
                 MAKE-ACCOUNT" m)]))
    dispatch))

; test
(define acc (make-account 100 'secret-password))

((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
