#lang sicp

(define (filtered-accumulate combiner null-value term a next b predicate?)
  (if (> a b)
      null-value
      (if (predicate? a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b predicate?)))))
