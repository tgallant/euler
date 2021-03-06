(load "lib/helpers.scm")

;; e1

(define (mod-three-or-five? x)
  (if (or
       (= (modulo x 3) 0)
       (= (modulo x 5) 0)) #t #f))

(define (e1 x)
  (sum
   (filter
    mod-three-or-five?
    (iota x))))
