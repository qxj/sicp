(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value
                                         term (next a) next b filter))
          (combiner null-value
                    (filtered-accumulate combiner null-value
                                         term (next a) next b filter)))))

;; a)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (sum-primes a b)
  (define (next x)
    (+ x 1))
  (define (term x)
    x)
  (filtered-accumulate + 0 term a next b prime?))

(sum-primes 0 10)
(+ 1 2 3 5 7)

;; b)
(define (gcd~ a b)
  (if (= b 0)
      a
      (gcd~ b (remainder a b))))

(define (product-primes n)
  (define (next x)
    (+ x 1))
  (define (term x)
    x)
  (define (filter x)
    (= 1 (gcd~ x n)))
  (filtered-accumulate * 1 term 1 next n filter))

(product-primes 10)
(* 1 3 7 9)
