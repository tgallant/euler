(load "lib/helpers.scm")

;; e25

(define fib
  (lazy-cons 1
             (lazy-cons 1
                        (lazy-map + fib (lazy-cdr fib)))))

(define (e25 n)
  (define (e25-inner x)
    (let ((y (lazy-ref fib x)))
      (if (>= (length (num->list y)) n)
          (+ x 1)
          (e25-inner (+ x 1)))))
  (e25-inner 1))
