(load "lib/helpers.scm")

;; e9

(define (triplets x)
  (define (triplets-inner m n)
    (let ((a (* x (- (sqr m) (sqr n))))
          (b (* x (* (* m n) 2)))
          (c (* x (+ (sqr m) (sqr n)))))
      (if (> m 100)
          '()
          (if (< n m)
              (if (and (= (gcd m n) 1) (odd? (- m n)))
                  (cons (list a b c) (triplets-inner m (+ n 1)))
                  (triplets-inner m (+ n 1)))
              (if (and (= (gcd m n) 1) (odd? (- m n)))
                  (cons (list a b c) (triplets-inner (+ m 2) (+ m 1)))
                  (triplets-inner (+ m 2) (+ m 1)))))))
  (triplets-inner 2 1))
