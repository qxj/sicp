
(define (multiple a b)

  (define (double x)
    (* x 2))

  (define (halve x)
    (/ x 2))

  (cond ((= a 0) 0)
        ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (multiple (double a) (halve b)))
        (else (+ (multiple a (- b 1)) a))))
