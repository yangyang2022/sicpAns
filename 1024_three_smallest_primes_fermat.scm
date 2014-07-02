;report
(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***") (display elapsed-time))

;prime?
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base expo m)
  (cond ((= expo 0) 1)
        ((even? expo) (remainder (square
                                  (expmod base (/ expo 2) m))
                                m))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))

;test
(define (test start times)
  (if (> times 0)
    (begin (search-for-primes start 3) (test (* start 10) (- times 1)))
    (display "over")))

(define (search-for-primes start number)
  (se start number))

;search
(define (se st num)
  (if (> num 0)
    (if (fast-prime? st 1)
      (begin (timed-prime-test st)
              (se (+ st 1) (- num 1)))
      (se (+ st 1) num))))

