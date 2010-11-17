
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (f x)
    (if (= x 0) 1 x))
  (define (next x)
    (+ x 1))
  (product f 0 next n))

(define (john-pi n)
  (define (f n)
    (/ (*
        (* 2 n)
        (+ 2 (* 2 n)))
       (*
        (+ 1 (* 2 n))
        (+ 1 (* 2 n)))))
  (define (next n)
    (+ 1 n))
  (* 4
     (product f 1 next n)))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
