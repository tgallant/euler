(load "lib/helpers.scm")

;; e54

(define (get-hands)
  (read-lines "poker.txt"))

(define (string->hand str)
  (map string->list (string-split str)))

(define (royal-flush? c))
(define (straight-flush? c))
(define (four-of-a-kind? c))
(define (full-house? c))
(define (flush? c))
(define (straight? c))
(define (three-of-a-kind? c))
(define (two-pair? c))
(define (one-pair? c))

(define (classify-hand hand)
  (define (inner i suit same-suit values)
    (if (>= i (length hand))
        (list same-suit values)
        (let ((card (list-ref hand i)))
          (if (eq? (list-ref card 1) suit)
              (inner (+ i 1) (list-ref card 1) same-suit (cons (list-ref card 0) values))
              (inner (+ i 1) (list-ref card 1) #f (cons (list-ref card 0) values))))))
  (let ((c (inner 0 0 #t '())))
    (cond ((royal-flush? c) 9)
          ((straight-flush? c) 8)
          ((four-of-a-kind? c) 7)
          ((full-house? c) 6)
          ((flush? c) 5)
          ((straight? c) 4)
          ((three-of-a-kind? c) 3)
          ((two-pairs? c) 2)
          ((one-pair? c) 1)
          (else 0))))

(define (score p1 p2)
  (let ((p1-hand (classify-hand p1))
        (p2-hand (classify-hand p2)))
    (cond ((> p1-hand p2-hand) #t)
          ((< p1-hand p2-hand) #f)
          (else (compare-hands p1-hand p2-hand)))))

(define (e54)
  (let ((hands (get-hands)))
    (define (inner i wins)
      (if (> i (length hands))
          wins
          (let ((p1 (string->hand (take 5 hands)))
                (p2 (string->hand (from 5 hands))))
            (if (score p1 p2)
                (inner (+ i 1) (+ wins 1))
                (inner (+ i 1) wins)))))
    (inner 0 0)))
