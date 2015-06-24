(load "lib/helpers.scm")

;; e21

(define (d x)
  (let ((y (factors x)))
    (if (> (length y) 1)
        (reduce + (factors x))
        0)))

(define (e21 n)
  (define (e21-inner x)
    (if (> x n)
        '()
        (if (and (= (d (d x)) x) (not (= (d x) x)))
            (cons x (e21-inner (+ x 1)))
            (e21-inner (+ x 1)))))
  (e21-inner 1))
