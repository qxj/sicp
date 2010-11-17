
(define (fast-multiple a b)

  (define (double x)
    (* x 2))

  (define (halve x)
    (/ x 2))

  (define (fast-multiple-iter a b c)
    (cond ((= a 0) 0)
          ((= b 0) 0)
          ((= b 1) (+ a c))
          ((even? b) (fast-multiple-iter (double a) (halve b) c))
          (else (fast-multiple-iter a (- b 1) (+ a c)))))

  (fast-multiple-iter a b 0))
