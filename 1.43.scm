(define (repeated f n)
  (define (iter x i)
    (if (= i n)
        (f x)
        (f (iter x (+ i 1)))))
  (lambda (x) (iter x 1)))

(define (square x) (* x x))
((repeated square 2) 5)
;; ((lambda (x) (square (square x))) 5)

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))
