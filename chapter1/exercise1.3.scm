(define (sum x y) (+ x y))

(define (max_sum x y z)
  (cond
    ((and (>= x z) (>= y z)) (sum x y))   ;z最小
    ((and (>= x y) (>= z y)) (sum x z))   ;y最小
    ((and (>= y x) (>= z x)) (sum y z))   ;x最小
  )
)