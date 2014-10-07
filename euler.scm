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

(define big-num 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)

(define big-num2 (list
                  37107287533902102798797998220837590246510135740250
                  46376937677490009712648124896970078050417018260538
                  74324986199524741059474233309513058123726617309629
                  91942213363574161572522430563301811072406154908250
                  23067588207539346171171980310421047513778063246676
                  89261670696623633820136378418383684178734361726757
                  28112879812849979408065481931592621691275889832738
                  44274228917432520321923589422876796487670272189318
                  47451445736001306439091167216856844588711603153276
                  70386486105843025439939619828917593665686757934951
                  62176457141856560629502157223196586755079324193331
                  64906352462741904929101432445813822663347944758178
                  92575867718337217661963751590579239728245598838407
                  58203565325359399008402633568948830189458628227828
                  80181199384826282014278194139940567587151170094390
                  35398664372827112653829987240784473053190104293586
                  86515506006295864861532075273371959191420517255829
                  71693888707715466499115593487603532921714970056938
                  54370070576826684624621495650076471787294438377604
                  53282654108756828443191190634694037855217779295145
                  36123272525000296071075082563815656710885258350721
                  45876576172410976447339110607218265236877223636045
                  17423706905851860660448207621209813287860733969412
                  81142660418086830619328460811191061556940512689692
                  51934325451728388641918047049293215058642563049483
                  62467221648435076201727918039944693004732956340691
                  15732444386908125794514089057706229429197107928209
                  55037687525678773091862540744969844508330393682126
                  18336384825330154686196124348767681297534375946515
                  80386287592878490201521685554828717201219257766954
                  78182833757993103614740356856449095527097864797581
                  16726320100436897842553539920931837441497806860984
                  48403098129077791799088218795327364475675590848030
                  87086987551392711854517078544161852424320693150332
                  59959406895756536782107074926966537676326235447210
                  69793950679652694742597709739166693763042633987085
                  41052684708299085211399427365734116182760315001271
                  65378607361501080857009149939512557028198746004375
                  35829035317434717326932123578154982629742552737307
                  94953759765105305946966067683156574377167401875275
                  88902802571733229619176668713819931811048770190271
                  25267680276078003013678680992525463401061632866526
                  36270218540497705585629946580636237993140746255962
                  24074486908231174977792365466257246923322810917141
                  91430288197103288597806669760892938638285025333403
                  34413065578016127815921815005561868836468420090470
                  23053081172816430487623791969842487255036638784583
                  11487696932154902810424020138335124462181441773470
                  63783299490636259666498587618221225225512486764533
                  67720186971698544312419572409913959008952310058822
                  95548255300263520781532296796249481641953868218774
                  76085327132285723110424803456124867697064507995236
                  37774242535411291684276865538926205024910326572967
                  23701913275725675285653248258265463092207058596522
                  29798860272258331913126375147341994889534765745501
                  18495701454879288984856827726077713721403798879715
                  38298203783031473527721580348144513491373226651381
                  34829543829199918180278916522431027392251122869539
                  40957953066405232632538044100059654939159879593635
                  29746152185502371307642255121183693803580388584903
                  41698116222072977186158236678424689157993532961922
                  62467957194401269043877107275048102390895523597457
                  23189706772547915061505504953922979530901129967519
                  86188088225875314529584099251203829009407770775672
                  11306739708304724483816533873502340845647058077308
                  82959174767140363198008187129011875491310547126581
                  97623331044818386269515456334926366572897563400500
                  42846280183517070527831839425882145521227251250327
                  55121603546981200581762165212827652751691296897789
                  32238195734329339946437501907836945765883352399886
                  75506164965184775180738168837861091527357929701337
                  62177842752192623401942399639168044983993173312731
                  32924185707147349566916674687634660915035914677504
                  99518671430235219628894890102423325116913619626622
                  73267460800591547471830798392868535206946944540724
                  76841822524674417161514036427982273348055556214818
                  97142617910342598647204516893989422179826088076852
                  87783646182799346313767754307809363333018982642090
                  10848802521674670883215120185883543223812876952786
                  71329612474782464538636993009049310363619763878039
                  62184073572399794223406235393808339651327408011116
                  66627891981488087797941876876144230030984490851411
                  60661826293682836764744779239180335110989069790714
                  85786944089552990653640447425576083659976645795096
                  66024396409905389607120198219976047599490197230297
                  64913982680032973156037120041377903785566085089252
                  16730939319872750275468906903707539413042652315011
                  94809377245048795150954100921645863754710598436791
                  78639167021187492431995700641917969777599028300699
                  15368713711936614952811305876380278410754449733078
                  40789923115535562561142322423255033685442488917353
                  44889911501440648020369068063960672322193204149535
                  41503128880339536053299340368006977710650566631954
                  81234880673210146739058568557934581403627822703280
                  82616570773948327592232845941706525094512325230608
                  22918802058777319719839450180888072429661980811197
                  77158542502016545090413245809786882778948721859617
                  72107838435069186155435662884062257473692284509516
                  20849603980134001723930671666823555245252804609722
                  53503534226472524250874054075591789781264330331690))

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

;; solutions

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
