(load "lib/helpers.scm")

;; e14

(define (collaz-seq n)
  (if (= n 1)
      '()
      (if (even? n)
          (let ((x (/ n 2)))
            (cons x (collaz-seq x)))
          (let ((x (+ (* 3 n) 1)))
            (cons x (collaz-seq x))))))

(define (e14 n)
  (define (e14-inner cur max num)
    (if (> cur n)
        num
        (let ((x (length (collaz-seq cur))))
          (if (> x max)
              (e14-inner (+ cur 1) x cur)
              (e14-inner (+ cur 1) max num)))))
  (e14-inner 800000 0 0))
