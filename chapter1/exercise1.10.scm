;Ackermann
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))
              )
        )
  )
)

; 1024
(A 1 10)
; 16
(A 2 3)
; 65536
(A 3 3)

; f(n) = 2n
(define (f n) (A 0 n))
; g(n) = 2^n
(define (g n) (A 1 n))
; h(n) = 2^(2^(2^(2^....))) (n-1个)
(define (h n) (A 2 n))
; 5n^2
(define (k n) (* 5 n n))