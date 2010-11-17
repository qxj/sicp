
(define (sum-squares-two-larger x y z)
  (- (+ (squares x)
        (squares y)
        (squares z))
     (squares (min x y z))))

(define (squares x) (* x x))

(sum-squares-two-larger 1 2 3)
