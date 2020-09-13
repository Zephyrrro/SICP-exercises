#lang racket

(define (square a)
  (* a a))

(define (random-number min max)
  (+ min (floor (* (random) (+ (- max min) 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                      m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))
  )
)

(define (fermat-test n)
  (define (helper a)
    (= (expmod a n n) a))
  (helper (random-number 1 (- n 1))))

(define (fast-prime? n times)
  (cond ((= times 0) (display #t))
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else (display #f))
  )
)


(fast-prime? 561 10000)
(newline)
(fast-prime? 1105 10000)
(newline)
(fast-prime? 1729 10000)
(newline)
(fast-prime? 2465 10000)
(newline)
(fast-prime? 2821 10000)
(newline)
(fast-prime? 6601 10000)

