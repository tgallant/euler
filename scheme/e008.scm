(load "lib/helpers.scm")

;; e8

(define (e8 n)
  (define (e8-inner x)
    (let ((i (apply * (take 13 (from x n)))))
      (if (< x 987)
          (cons i (e8-inner (+ x 1)))
          '())))
  (e8-inner 0))

(apply max (e8 (num->list big-num)))
