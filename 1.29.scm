
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; (define (simpson-integral f a b n)

;;   (define (next x)
;;     (+ x (h)))

;;   (define (next-1 x)
;;     (+ x (* 2 (h))))

;;   (define (h)
;;     (/ (- b a) n))

;;    (* (/ (h) 3)
;;       (+ (sum f a next b)
;;          (* 3 (sum f (+ a (h)) next-1 (- b (h))))
;;          (sum f (+ a (* 2 (h))) next-1 (- b (* 2 (h)))))))

(define (simpson-integral f a b n)

  (define (next x)
    (+ x 1))

  (define (h)
    (/ (- b a) n))

  (define (f-wrap k)
    (* (cond ((= k 0) 1)
             ((= k n) 1)
             ((even? k) 4)
             (else 2))
       (f (+ a (* k (h))))))

  (* (/ (h) 3)
     (sum f-wrap 0 next n)))
