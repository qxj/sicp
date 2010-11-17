
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (define (sign)
    (cond ((or (and (> n 0) (< d 0))
               (and (< n 0) (> d 0)))
           -)
          (else
           +)))
  (let ((g (gcd n d)))
    (cons ((sign) (abs (/ n g)))
          (abs (/ d g)))))
