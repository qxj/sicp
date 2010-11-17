(define (tan-cf x k)
  (define (square x)
    (* x x))
  (define (iter i)
    (if (= i k)
        (square x)
        (- (- (* 2 i) 1)
           (/ (square x) (iter (+ i 1))))))
  (/ x (iter 1)))

(tan-cf 10.0 100)