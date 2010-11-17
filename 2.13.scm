;; Present interval by center and width:
;;
;; x := (xc-dx, xc+dx)
;; y := (yc-dy, yc+dy)
;; dx->0, dy->0
;;
;; Assume both x and y are positive intervals, refering to Exercise 2.11,
;; we can directly get the lower bound and upper bound of the
;; multiplication result as below:
;;
;; x*y = (xc-dx)*(yc-dy),
;;       (xc+dx)*(yc+dx)
;;     = xc*yc-xc*dy-yc*dx+dx*dy,
;;       xc*yc+xc*dy+yc*dx+dx*dy,
;;
;; Because dx->0, dy->0, we can omit dx*dy.
;;
;; x*y = xc*yc-xc*dy-yc*dx,
;;       xc*yc+xc*dy+yc*dx
;;     = xc*yc * (1-dy/yc-dx/xc),
;;       xc*yc * (1+dy/yc+dx/xc)
;;
;; In Exercise 2.12 we already defined percentage tolerance =
;; width/center, so let px=dx/xc, py=dy/yc:
;;
;; x*y = xc*yc * (1-px-py),
;;       xc*yc * (1+px+py)
;;     = xc*yc * (1-(px+py), 1+(px+py))
;;
;; let new center zc=zc*yc, new percentage pz=px+py, then
;;
;; x*y = zc * (1-pz, 1+pz)
;;


(define (make-interval a b) (cons a b))

(define (upper-bound i) (car i))

(define (lower-bound i) (cdr i))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((width (* c p)))
    (make-center-width c width)))

(define (percent i)
  (/ (width i) (center i)))

(define (mul-interval x y)
  (make-center-percent (* (center x) (center y))
                       (+ (percent x) (percent y))))
