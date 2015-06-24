(load "lib/helpers.scm")

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
