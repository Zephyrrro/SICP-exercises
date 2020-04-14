(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y
  )
)

;infinitely apply itself
;(test 0 (p))