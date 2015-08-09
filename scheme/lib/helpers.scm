;; helpers

(define (sum l)
  (if (null? l)
      0
      (+ (car l) (sum (cdr l)))))

(define (sqr x)
  (* x x))

(define (rev x)
  (string->number
   (list->string
    (reverse (string->list (number->string x))))))

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (modulo x y))))

(define (reduce func lst)
  (let loop ((val (car lst))
             (lst (cdr lst)))
    (if (null? lst) val
        (loop (func val (car lst)) (cdr lst)))))

(define (sieve n)
  (define (aux u v)
    (let ((p (car v)))
      (if (> (* p p) n)
        (let rev-append ((u u) (v v))
          (if (null? u) v (rev-append (cdr u) (cons (car u) v))))
        (aux (cons p u)
          (let wheel ((u '()) (v (cdr v)) (a (* p p)))
            (cond ((null? v) (reverse u))
                  ((= (car v) a) (wheel u (cdr v) (+ a p)))
                  ((> (car v) a) (wheel u v (+ a p)))
                  (else (wheel (cons (car v) u) (cdr v) a))))))))
  (aux '(2)
    (let range ((v '()) (k (if (odd? n) n (- n 1))))
      (if (< k 3) v (range (cons k v) (- k 2))))))

(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (error "Index out of bounds.")
    (if (eq? n 0)
      (car l)
      (nth (- n 1) (cdr l)))))

(define (num->list num)
  (if (< num 10)
      (list num)
      (append (num->list (floor (/ num 10)))
              (list (- num (* 10 (floor (/ num 10))))))))

(define (take n lst)
  (if (= n 0)
      '()
      (cons (car lst) (take (- n 1) (cdr lst)))))

(define (from n lst)
  (if (= n 0)
      lst
      (from (- n 1) (cdr lst))))

(define (fold-left op initial items)
  (define (loop result rest)
    (if (null? rest)
        result
        (loop (op result (car rest))
              (cdr rest))))
  (loop initial items))

(define (list->num list)
  (fold-left (lambda (value digit)
                     (+ (* value 10) digit))
             0
             list))

(define lazy-car car)

(define (lazy-cdr ls)
  (force (cdr ls)))

(define-syntax lazy-cons
  (syntax-rules ()
    ((_ a b) (cons a (delay b)))))

(define (lazy-map fn . lss)
  (if (memq '() lss)
      '()
      (lazy-cons (apply fn (map lazy-car lss))
                 (apply lazy-map fn (map lazy-cdr lss)))))

(define (lazy-filter pred ls)
  (if (null? ls)
      '()
      (let ((obj (lazy-car ls)))
        (if (pred obj)
            (lazy-cons obj (lazy-filter pred (lazy-cdr ls)))
            (lazy-filter pred (lazy-cdr ls))))))

(define (lazy-ref ls n)
  (if (= n 0)
      (lazy-car ls)
      (lazy-ref (lazy-cdr ls) (- n 1))))

(define (head ls n)
  (if (= n 0)
      '()
      (cons (lazy-car ls) (head (lazy-cdr ls) (- n 1)))))
