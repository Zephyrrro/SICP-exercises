; recursion
(define (f-recu n)
  (if (< n 3)
    n
    (+ (f-recu (- n 1))
       (* 2 (f-recu (- n 2)))
       (* 3 (f-recu (- n 3)))
    )
  )
)

; iteration
; a: f(n-1) b: f(n-2) c: f(n-3)
(define (f-iter n)
  (define (f-iter-inner a b c count)
    (cond ((= count 2) a)
          ((= count 1) b)
          ((= count 0) c)
          (else (f-iter-inner (+ a (* b 2) (* c 3))
                              a
                              b
                              (- count 1)
                )
          )
    )
  )
  (if (< n 0)
    0
    (f-iter-inner 2 1 0 n)
  ) 
)