#lang racket

(define (square a)
  (* a a))

(define (expmod base exp m)
  (define (square-check x)
    (define (helper x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (helper x (remainder (square x) m))
  )
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square-check (expmod base (/ exp 2) m))
                      m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))
  )
)

(define (fermat-test n)
  (define (try-it a)
    (and (not (= a 0)) (= (expmod a (- n 1) n) 1)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) (display #t))
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else (display #f))
  )
)

; true
(fast-prime? 1009 1000)
(newline)
;true
(fast-prime? 1013 1000)
(newline)
;false
(fast-prime? 561 1000)
(newline)
;false
(fast-prime? 1105 1000)
(newline)
;false
(fast-prime? 1729 1000)
(newline)
;false
(fast-prime? 2465 1000)
(newline)
;false
(fast-prime? 2821 1000)
(newline)
;false
(fast-prime? 6601 10000)

