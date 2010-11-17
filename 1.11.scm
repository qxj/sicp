(define (fib n)
  (cond ((= 0 n) 1)
        ((= 1 n) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib1 n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      a
      (fib-iter (+ a b) a (- count 1))))

;;;;;;;;;;;;;;;;

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(define (f1 n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
