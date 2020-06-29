#lang racket

(define (next divisor)
  (if (= (remainder divisor 2) 0)
      (+ divisor 1)
      (+ divisor 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

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
    (helper (+ start 1) 3)))


(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
