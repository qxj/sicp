
(define (cont-frac n d k)
  (define (iter x)
    (if (= x k)
        (/ (n x) (d x))
        (/ (n x) (+ (d x) (iter (+ x 1))))))
  (iter 1))

(+ 2
   (cont-frac (lambda (x) 1.0)
              (lambda (x)
                (cond ((= (remainder x 3) 1) 1.0)
                      ((= (remainder x 3) 0) 1.0)
                      ((= (remainder x 3) 2)
                       (* (+ (/ x 3) (/ 1 3)) 2.0))))
              1000))
