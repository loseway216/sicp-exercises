#lang sicp
; 使用fast-prime O(logn) 优化timed-prime-test

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000) (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond
    [(= times 0) true]
    [(fermat-test n) (fast-prime? n (- times 1))]
    [else false]))

(define (expmod base exp m)
  (cond
    [(= exp 0) 1]
    [(even? exp) (remainder (square (expmod base (/ exp 2) m)) m)]
    [else (remainder (* base (expmod base (- exp 1) m)) m)]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (square a)
  (* a a))

; 写一个search-for-primes寻找大于n的counter个素数
(define (search-for-primes n counter)
  (if (even? n) (s-f-p (+ n 1) counter) (s-f-p n counter)))

(define (s-f-p n counter)
  (if (> counter 0)
      (if (timed-prime-test n) (s-f-p (+ n 2) (- counter 1)) (s-f-p (+ n 2) counter))
      "COMPUTATION COMPLETE"))

; test
(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
