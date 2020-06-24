(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; 正则序: 18次，在if中判断了14次，最后运算4次
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; if (xxx) // +1
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; if (xxx) // +2
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; if (xxx) // +4
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; if (xxx) // +7
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) // +4


; 应用序: 4次
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6) // +1
; (gcd 6 (remainder 40 6))
; (gcd 6 4) // +1
; (gcd 4 (remainder 6 4))
; (gcd 4 2) // +1
; (gcd 2 (remainder 4 2))
; (gcd 2 0) // +1
; 2