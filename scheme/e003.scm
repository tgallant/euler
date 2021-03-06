(load "lib/helpers.scm")

;; e3

(define (e3 n)
  (define (e3-inner num div)
    (if (> num 1)
        (if (= (modulo num div) 0)
            (e3-inner (/ num div) (- div 1))
            (e3-inner num (+ div 1)))
        (+ div 1)))
  (e3-inner n 2))
