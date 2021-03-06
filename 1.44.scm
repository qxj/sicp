(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x) (/ (+ (f (- x dx))
                      (f x)
                      (f (+ x dx))) 3))))

(define (repeated f n)
  (define (iter x i)
    (if (= i n)
        (f x)
        (f (iter x (+ i 1)))))
  (lambda (x) (iter x 1)))

(define (n-fold-smooth n)
  (lambda (x) ((repeated smooth n) x)))
