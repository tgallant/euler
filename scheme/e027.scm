(load "lib/helpers.scm")

;; e27

(define (lazy-contains? i l)
  (if (or (null? l) (> (car l) i)) #f
      (or (eq? (car l) i)
          (lazy-contains? i (lazy-cdr l)))))

(define (prime? n)
  (define (prime-test f r)
    (cond
     ((>= f r) #t)
     ((= (modulo n f) 0) #f)
     ((= (modulo n (+ f 2)) 0) #f)
     (else (prime-test (+ f 6) r))))
  (cond
   ((= n 1) #f)
   ((< n 4) #t)
   ((= (modulo n 2) 0) #f)
   ((< n 9) #t)
   ((= (modulo n 3) 0) #f)
   (else (or (prime-test 5 (floor (sqrt n))) #f))))

(define (integers-from n)
  (lazy-cons n (integers-from (+ n 1))))

(define integers
  (integers-from 1))

(define primes
  (lazy-filter prime? integers))
