
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (term a)
       (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; test
(define (test a b)
  (define (next x)
    (+ x 1))
  (define (term x)
    x)
  (define (sum-iter term a next b)
    (accumulate-iter + 0 term a next b))
  (sum-iter term a next b))

(test 1 10)
