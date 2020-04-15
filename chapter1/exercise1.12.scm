;pascal triangle
(define (pascal row col)
  (if (or (<= col 1) (>= col row))
    1
    (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))
  )
)

 ; Test
(display (pascal 1 1))
(newline)
(display (pascal 2 2))
(newline)
(display (pascal 3 2))
(newline)
(display (pascal 4 2))
(newline)
(display (pascal 5 2))
(newline)
(display (pascal 5 3) )