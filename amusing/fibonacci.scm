; recursion
(define (fib-recu n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recu (- n 1))
                 (fib-recu (- n 2)))
        )
  )
)

; iteration
(define (fib-iter n)
  (define (fib-iter-inner nextFib fib count)
    (if (= count 0)
      fib
      (fib-iter-inner (+ nextFib fib) nextFib (- count 1))
    )
  )
  (fib-iter-inner 1 0 n)
)