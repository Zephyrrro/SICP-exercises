#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
(search-for-primes 10000)       ;1e4
(search-for-primes 100000)      ;1e5
(search-for-primes 1000000)     ;1e6
; (search-for-primes 10000000)    ;1e7
; (search-for-primes 100000000)   ;1e8
; (search-for-primes 1000000000)  ;1e9

