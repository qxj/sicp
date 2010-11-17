
(define (carmichael-test n)

  (define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

  (define (test a n)
    (= (expmod a n n) a))

  (define (test-iter a n)
    (cond ((= a n) n)
          ((test a n) (test-iter (+ a 1) n))
          (else a)))

  (test-iter 1 n))
