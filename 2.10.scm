;; (define (div-interval x y)
;;   (mul-interval x
;;                 (make-interval (/ 1.0 (upper-bound y))
;;                                (/ 1.0 (lower-bound y)))))

(define (div-interval x y)
  (if (or (= 0 (upper-bound y))
          (= 0 (lower-bound y)))
      (error "Division by zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
