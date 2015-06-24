(load "lib/helpers.scm")

;; e63

(define (e63 n)
  (define (e63-inner x y count)
    (if (>= x n)
        count
        (let ((num-len (length (num->list (expt x y)))))
          (if (= num-len y)
              (e63-inner x (+ y 1) (+ count 1))
              (e63-inner (+ x 1) 1 count)))))
  (e63-inner 1 1 0))
