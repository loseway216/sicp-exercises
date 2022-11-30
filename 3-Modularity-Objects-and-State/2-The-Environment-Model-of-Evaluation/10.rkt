#lang sicp

; let是lambda的语法糖 嵌套了一层lambda 多创建了一个环境
(define (make-withdraw initial-amount)
  (let ([balance initial-amount])
    (lambda (amount)
      (if (>= balance amount)
          (begin
            (set! balance (- balance amount))
            balance)
          "Insufficient funds"))))
