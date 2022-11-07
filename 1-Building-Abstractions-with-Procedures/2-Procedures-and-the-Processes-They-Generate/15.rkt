#lang sicp
; 分析一个linear recursive process的步骤和空间时间复杂度

(define (cube x)
  (* x x x))
(define (p x)
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1)) angle (p (sine (/ angle 3.0)))))

; 根据以上sin函数公式，计算 (sine 12.15) 的steps
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine .15)))))
; (p (p (p (p (p (sine 0.05))))))
; 5次

; order of growth in space
; (sine a) O(an)

; order of growth in number of steps
; (sine a) O(log(a)) 不太会算
