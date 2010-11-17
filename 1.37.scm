
(define (cont-frac n d k)
  (define (iter x)
    (if (= x k)
        (/ (n x) (d x))
        (/ (n x) (+ (d x) (iter (+ x 1))))))
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)

(define (cont-frac-1 n d k)
  (define (iter x result)
    (if (= x 0)
        result
        (iter (- x 1) (/ (n x) (+ (d x) result)))))
  (iter k (/ (n x) (d x))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)
