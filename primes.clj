(defn prime? [n]
  (.isProbablePrime (BigInteger/valueOf n) 4))

(take 10001
      (filter prime? 
              (take-nth 2 
                        (range 1 Integer/MAX_VALUE))))

(defn prime-sums [n]
  (apply + (filter prime? (range 1 n))))
