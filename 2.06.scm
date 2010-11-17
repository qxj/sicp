;; Church numerals

(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x)))))
;; (lambda (f) (lambda (x) (f (lambda (y) y) x)))))
;; (lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x)))))
;; (lambda (f) (lambda (x) (f ((lambda (y) (f y)) x)))))
;; (lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; inspired by add-1
(define (+ a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

;; test case
(+ zero one)
;; (lambda (f) (lambda (x) ((one f) ((zero f) x))))
;; (lambda (f) (lambda (x) ((one f) ((lambda (y) y) x))))
;; (lambda (f) (lambda (x) ((one f) x)))
;; (lambda (f) (lambda (x) ((lambda (y) (f y)) x)))
;; (lambda (f) (lambda (x) (f x)))

(+ one two)
;; (lambda (f) (lambda (x) ((two f) ((one f) x))))
;; (lambda (f) (lambda (x) ((two f) ((lambda (y) (f y)) x))))
;; (lambda (f) (lambda (x) ((two f) (f x))))
;; (lambda (f) (lambda (x) ((lambda (y) (f (f y))) (f x))))
;; (lambda (f) (lambda (x) ((lambda (y) (f (f y))) (f x))))
;; (lambda (f) (lambda (x) (f (f (f x)))))
