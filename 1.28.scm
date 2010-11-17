
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (miller-test n)

  (define (try-it a)
    (= (expmod a (- n 1) n) 1))

  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)

  (define (nontrivial-test x n)
    (if (and (not (= x 1))
             (not (= x (- n 1)))
             (= (remainder (square x) n) 1))
        0
        x))

  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (nontrivial-test (expmod base (/ exp 2) m) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
