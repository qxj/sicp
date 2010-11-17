(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (repeated f n)
  (define (iter x i)
    (if (= i n)
        (f x)
        (f (iter x (+ i 1)))))
  (lambda (x) (iter x 1)))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (damp-num n)
  (floor (/ (log n) (log 2))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (nth-root-of x n)
  (fixed-point-of-transform
   (lambda (y) (/ x (expt y (- n 1))))
   (repeated average-damp (damp-number n)) 1.0))
