(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(((double (double double)) inc) 5)

;; let's simulate applicative-order substitution

(((double (lambda (x) (double (double x)))) inc) 5)

(((lambda (x1) ((lambda (x) (double (double x)))
               ((lambda (x2) (double (double x2))) x1))) inc) 5)

(((lambda (x) (double (double x)))
  ((lambda (x2) (double (double x2))) inc)) 5)

(((lambda (x) (double (double x)))
  (double (double inc))) 5)

(((lambda (x) (double (double x)))
  (double (lambda (x1) (inc (inc x1))))) 5)

(((lambda (x) (double (double x)))
  (lambda (x2) ((lambda (x1) (inc (inc x1)))
                ((lambda (x1) (inc (inc x1))) x2)))) 5)

;; f := (lambda (x2) ((lambda (x1) (inc (inc x1)))
;;                    ((lambda (x3) (inc (inc x3))) x2)))

(((lambda (x) (double (double x))) f) 5)

((double (double f)) 5)

((double (lambda (x) (f (f x)))) 5)

((lambda (x1) ((lambda (x) (f (f x)))
               ((lambda (x2) (f (f x2))) x1))) 5)

((lambda (x) (f (f x)))
 ((lambda (x2) (f (f x2))) 5))

((lambda (x) (f (f x)))
 (f (f 5)))

;; f=>

((lambda (x) (f (f x)))
 (f ((lambda (x2) ((lambda (x1) (inc (inc x1)))
                   ((lambda (x3) (inc (inc x3))) x2))) 5)))

((lambda (x) (f (f x)))
 (f ((lambda (x1) (inc (inc x1)))
     ((lambda (x3) (inc (inc x3))) 5))))

((lambda (x) (f (f x)))
 (f ((lambda (x1) (inc (inc x1)))
     (inc (inc 5)))))

((lambda (x) (f (f x)))
 (f ((lambda (x1) (inc (inc x1))) 7)))

((lambda (x) (f (f x)))
 (f (inc (inc 7))))

((lambda (x) (f (f x)))
 (f 9))

;; f=>

((lambda (x) (f (f x)))
 ((lambda (x2) ((lambda (x1) (inc (inc x1)))
                ((lambda (x3) (inc (inc x3))) x2))) 9))

((lambda (x) (f (f x)))
 ((lambda (x1) (inc (inc x1)))
  ((lambda (x3) (inc (inc x3))) 9)))

((lambda (x) (f (f x)))
 ((lambda (x1) (inc (inc x1)))
  (inc (inc 9))))

((lambda (x) (f (f x)))
 ((lambda (x1) (inc (inc x1)))
  11))

((lambda (x) (f (f x)))
 (inc (inc 11)))

((lambda (x) (f (f x))) 13)

(f (f 13))

;; f=>

(f ((lambda (x1) (inc (inc x1)))
    ((lambda (x3) (inc (inc x3))) 13)))

(f ((lambda (x1) (inc (inc x1)))
    (inc (inc 13))))

(f (inc (inc 15)))

;; f=>

((lambda (x1) (inc (inc x1)))
 ((lambda (x3) (inc (inc x3))) 17))

((lambda (x1) (inc (inc x1)))
 (inc (inc 17)))

(inc (inc 19))

;; finaly ...

21
