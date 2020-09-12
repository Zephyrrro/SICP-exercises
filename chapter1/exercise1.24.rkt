#lang racket

(define (random-number min max)
  (+ min (floor (* (random) (+ (- max min) 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (random-number 1 (- n 1))))

(define (square n)
  (* n n))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display "  ***  ")
  (display elapsed-time)
  (newline))

(define (search-for-primes start)
  (define (helper n count)
    (when (> count 0)
      (if (timed-prime-test n)
        (helper (+ n 2) (- count 1))
        (helper (+ n 2) count))
    )
  )
  (if (odd? start)
    (helper start 3)
    (helper (+ start 1) 3))
)

(search-for-primes 1000)        ;1e3
(newline)
(search-for-primes 10000)       ;1e4
(newline)
(search-for-primes 100000)      ;1e5
(newline)
(search-for-primes 1000000)     ;1e6
(newline)
; (search-for-primes 10000000)    ;1e7
; (search-for-primes 100000000)   ;1e8
; (search-for-primes 1000000000)  ;1e9