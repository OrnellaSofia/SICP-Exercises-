;; Using DrRacket 8.4
;; Write an procedure called product that returns the product of the values of a function at points over a given range. 

(define (product a b)
(if (> a b)
1
(* a (product (+ a 1) b))))

;; Show how to define factorial in terms of product. 

(define (factorial x)
  (if (= x 0)
  0
  (product 1 x))
 )
 
