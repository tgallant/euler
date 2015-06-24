(load "lib/helpers.scm")

;; e2

(define (fib x)
  (define (fib-inner n)
    (if (<= n 2) 1
        (+ (fib-inner (- n 1)) (fib-inner (- n 2)))))
  (define (fib-list num)
    (let ((i (fib-inner num)))
      (if (> i x)
          '()
          (cons i (fib-list (+ num 1))))))
  (sum (filter even? (fib-list 1))))
