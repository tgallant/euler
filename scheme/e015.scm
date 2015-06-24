(load "lib/helpers.scm")

;; e15

(define (factorial n)
  (reduce * (cdr (iota (+ n 1)))))

(define (choose k n)
  (if (= n 0) 1
      (/ (factorial n)
         (* (factorial k) (factorial (- n k))))))
