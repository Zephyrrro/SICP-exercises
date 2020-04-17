(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (<= (abs angle) 0.1)
    angle
    (p (sine (/ angle 3.0)))))

; p被使用5次
(sine 12.15)

(define a 12.15)
; 空间和步数的增长阶均为 Θ(Math.ceil(log3 (10a)))，即 Θ(log a)
(display (ceiling (/ (log (* 10 a)) (log 3))))
