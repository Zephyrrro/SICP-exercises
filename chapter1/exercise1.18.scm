; 同1.17，本来1.17应该写递归过程的👀，递归如下

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (fast-mult-recu a b)
  (cond ((= a 0) 0)
        ((even? a) (double (fast-mult-recu (halve a) b)))
        (else (+ b (fast-mult-recu (- a 1) b)))
  )
)

(display (fast-mult-recu 3 4))
(newline)
(display (fast-mult-recu 3 0))
(newline)
(display (fast-mult-recu 9 10))
(newline)
(display (fast-mult-recu 3 1))
(exit)