;; 1.33 - filter-accumulate

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
      (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
      (filtered-accumulate combiner null-value term (next a) next b filter))  
      ))

(define (square x)
  (* x x)
  )

;; check if a number is prime
;; taken from jaredkrinke's github
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (is-prime n)
  (if (= n 1)
      false
  (= n (smallest-divisor n))))

;; 1.33 a - sum-prime-squares

(define (square-sum a b)
  (+ a b)
  )

(define (square-term a)
  (square a)
  )

(define (sum-next a)
  (+ a 1)
  )

(define (sum-prime-squares a b)
  (filtered-accumulate square-sum 0 square-term a sum-next b is-prime)
  )
