(load "lib/helpers.scm")

;; e4

(define (e4)
  (define (e4-inner x y)
    (let ((i (* x y)))
      (if (> x 999)
          '()
          (if (< y 999)
              (if (= i (rev i))
                  (cons i (e4-inner x (+ y 1)))
                  (e4-inner x (+ y 1)))
              (if (= i (rev i))
                  (cons i (e4-inner (+ x 1) 900))
                  (e4-inner (+ x 1) 900))))))
  (apply max (e4-inner 900 900)))
