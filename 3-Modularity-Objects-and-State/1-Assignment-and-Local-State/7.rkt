#lang sicp

(define (make-joint target-account password new-password)
  ())

(define (make-account balance password)
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
      [(not (eq? password p)) (lambda (x) "incorrect password")]
      [(eq? m 'withdraw) withdraw]
      [(eq? m 'deposit) deposit]
      [else (error "Unknown request:
                 MAKE-ACCOUNT" m)]))
  dispatch)

; test
(define peter-acc (make-account 100 'open-sesame))

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((peter-acc 'open-sesame 'withdraw) 40)

((paul-acc 'rosebud 'withdraw) 40)
; expect 20