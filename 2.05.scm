(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (strip n x)
  (cond ((= (remainder n x) 0)
         (strip (/ n x) x))
        (else n)))

(define (log n x)
  (if (= n x)
      1
      (+ 1 (log (/ n x) x))))

(define (car x)
  (log (strip x 3) 2))

(define (cdr x)
  (log (strip x 2) 3))
