(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (define (product a b n)
    (cond ((= a 0) n)
          ((even? a) (product (halve a) (double b) n))
          (else (product (- a 1) b (+ n b)))
    )
  )
  (product a b 0)
)

(display (* 3 2))
(newline)
(display (* 4 6))
(newline)
(display (* 9 10))
(newline)
(display (* 3 0))
(newline)
(display (* 3 1))
(newline)
(exit)