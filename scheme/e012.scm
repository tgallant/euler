(load "lib/helpers.scm")

;; e12

(define (factors n)
  (define (*factors d)
    (cond ((>= d n) (list))
          ((= (modulo n d) 0) (cons d (*factors (+ d 1))))
          (else (*factors (+ d 1)))))
  (*factors 1))

(define (e12 n)
  (define (e12-inner x)
    (let ((i (length (factors (+ (reduce + (iota x)) x)))))
      (if (> i n)
          (+ (reduce + (iota x)) x)
          (e12-inner (+ x 1)))))
  (e12-inner 1))
