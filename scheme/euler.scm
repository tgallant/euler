;; solutions

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

;; e3

(define (e3 n)
  (define (e3-inner num div)
    (if (> num 1)
        (if (= (modulo num div) 0)
            (e3-inner (/ num div) (- div 1))
            (e3-inner num (+ div 1)))
        (+ div 1)))
  (e3-inner n 2))

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

;; e5

(define (sum-of-sq x)
  (sum (map sqr (cdr (iota x)))))

(define (sq-of-sum x)
  (sqr (sum (cdr (iota x)))))

(define (e6 x)
  (- (sq-of-sum x) (sum-of-sq x)))

;; e7

(nth 10000 (sieve 110000))

;; e8

(define (e8 n)
  (define (e8-inner x)
    (let ((i (apply * (take 13 (from x n)))))
      (if (< x 987)
          (cons i (e8-inner (+ x 1)))
          '())))
  (e8-inner 0))

(apply max (e8 (num->list big-num)))

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

;; e10

(reduce + (sieve 2000000))

;; e11


;; e12

(define (factors n)
  (define (*factors d)
    (cond ((>= d n) (list))
          ((= (modulo n d) 0) (cons d (*factors (+ d 1))))
          (else (*factors (+ d 1)))))
  (*factors 1))

(define (e12 n)
  (define (e12-inner x)
    (let ((i (length (factors (+ (reduce + (iota x)) x)))))
      (if (> i n)
          (+ (reduce + (iota x)) x)
          (e12-inner (+ x 1)))))
  (e12-inner 1))

;; e13

(take 10 (num->list (reduce + big-num2)))

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

;; e15

(define (factorial n)
  (reduce * (cdr (iota (+ n 1)))))

(define (choose k n)
  (if (= n 0) 1
      (/ (factorial n)
         (* (factorial k) (factorial (- n k))))))

;; e16

(reduce + (num->list (expt 2 1000)))

;; e17

(define (ones x)
  (cond ((= x 0) 0)
        ((= x 1) 3)
        ((= x 2) 3)
        ((= x 3) 5)
        ((= x 4) 4)
        ((= x 5) 4)
        ((= x 6) 3)
        ((= x 7) 5)
        ((= x 8) 5)
        ((= x 9) 4)
        ((= x 10) 3)
        ((= x 11) 6)
        ((= x 12) 6)
        ((= x 13) 8)
        ((= x 14) 8)
        ((= x 15) 7)
        ((= x 16) 7)
        ((= x 17) 9)
        ((= x 18) 8)
        ((= x 19) 8)))

(define (tens x)
  (cond ((= x 0) 0)
        ((= x 2) 6)
        ((= x 3) 6)
        ((= x 4) 5)
        ((= x 5) 5)
        ((= x 6) 5)
        ((= x 7) 7)
        ((= x 8) 6)
        ((= x 9) 6)))

(define (tens-sum x)
  (if (< x 20)
      (ones x)
      (let ((lst (num->list x)))
        (if (= (list->num (cdr lst)) 0)
            (tens (car lst))
            (+ (tens (car lst)) (ones (car (cdr lst))))))))

(define (hundreds-sum x)
  (if (< x 100)
      (tens-sum x)
      (let* ((lst (num->list x))
             (lst2 (list->num (cdr lst))))
        (if (= lst2 0)
            (+ (ones (car lst)) 7)
            (+ (+ (ones (car lst)) 10) (tens-sum (list->num (cdr lst))))))))

(define (e17 x)
  (if (< x 1)
      '()
      (cons (hundreds-sum x) (e17 (- x 1)))))

;; e21

(define (d x)
  (let ((y (factors x)))
    (if (> (length y) 1)
        (reduce + (factors x))
        0)))

(define (e21 n)
  (define (e21-inner x)
    (if (> x n)
        '()
        (if (and (= (d (d x)) x) (not (= (d x) x)))
            (cons x (e21-inner (+ x 1)))
            (e21-inner (+ x 1)))))
  (e21-inner 1))

;; e25

(define fib
  (lazy-cons 1
             (lazy-cons 1
                        (lazy-map + fib (lazy-cdr fib)))))

(define (e25 n)
  (define (e25-inner x)
    (let ((y (lazy-ref fib x)))
      (if (>= (length (num->list y)) n)
          (+ x 1)
          (e25-inner (+ x 1)))))
  (e25-inner 1))

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

;; e63

(define (root number degree tolerance)
  (define (good-enough? next guess)
    (< (abs (- next guess)) tolerance))
  (define (improve guess)
    (/ (+ (* (- degree 1) guess) (/ number (expt guess (- degree 1)))) degree))
  (define (*root guess)
    (let ((next (improve guess)))
      (if (good-enough? next guess)
          guess
          (*root next))))
  (*root 1.0))

(define (e63 n)
  (define (e63-inner x)
    (if (> x n)
        '()
        (let* ((len (length (num->list x)))
               (r-guess (floor (root x len .001)))
               (r-actual (expt r-guess len)))
          (if (= x r-actual)
              (cons x (e63-inner (+ x 1)))
              (e63-inner (+ x 1))))))
  (e63-inner 1))

(define (e63-test x)
  (let* ((len (length (num->list x)))
         (r-guess (floor (root x len .001)))
         (r-actual (expt r-guess len)))
    (if (eq? x r-actual)
        "woot")))

;; e92

(define (chain x)
  (let ((digit-square
         (reduce + (map (lambda (w) (* w w)) (num->list x)))))
    (cond
     ((= digit-square 89) #t)
     ((= digit-square 1) #f)
     (else (chain digit-square)))))

(define (e92 x)
  (define (inner y count)
    (if (> y x)
        count
        (if (chain y)
            (inner (+ y 1) (+ count 1))
            (inner (+ y 1) count))))
  (inner 1 0))
