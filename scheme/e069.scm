(load "lib/helpers.scm")

;; e69

(define (e69 n)
  (let ((primes (sieve 200)))
    (define (inner i result)
      (let ((res (* result (list-ref primes i))))
        (if (> res n)
            result
            (inner (+ i 1) res))))
    (inner 0 1)))

(write (e69 1000000))
(newline)
