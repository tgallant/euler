(define (prime? n)
  (define (prime-test f r)
    (cond
     [(<= f r) #t]
     [(= 0 (modulo n f)) #f]
     [(= 0 (modulo n (+ f 2))) #f]
     [else (prime-test (+ f 6) r)]))
  (cond
   [(= n 1) #f]
   [(< n 4) #t]
   [(= 0 (modulo n 2)) #f]
   [(< n 9) #t]
   [(= 0 (modulo n 3)) #f]
   [else (prime-test 5 (sqrt n))]))
