
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (new-sqrt x)
  (sqrt-iter 1.0 x))

(define x 0.00000001)
(square (new-sqrt x))

;; another good-enough?

(define (sqrt-iter~ guess last-guess x)
  (if (good-enough?~ guess last-guess)
      guess
      (sqrt-iter~ (improve guess x) guess x)))

(define (good-enough?~ guess last-guess)
  (< (/ (abs (- guess last-guess)) guess) 0.001))

(define (sqrt~ x)
  (sqrt-iter~ 1.0 0 x))

(sqrt~ x)
