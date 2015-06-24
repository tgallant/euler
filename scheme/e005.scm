(load "lib/helpers.scm")

;; e5

(define (sum-of-sq x)
  (sum (map sqr (cdr (iota x)))))

(define (sq-of-sum x)
  (sqr (sum (cdr (iota x)))))

(define (e6 x)
  (- (sq-of-sum x) (sum-of-sq x)))
