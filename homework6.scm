;;; Write a scheme macro (firstNon0 <expr1> <expr2> <expr3>),
;;; which evaluates the <exprs> one by one until one of them evaluates to a non-0 value.
;;; As soon as it finds an <expr> which evaluates to a non-zero value,
;;; firstNon0 stops and returns that value.
;;; If all of the <expr>s evaluate to 0, firstNon0 should return 0.
;;; If you prefer, your macro can take more than three <expr>s

(define-syntax firstNon0
  (syntax-rules ( )
    ((_ expr1 expr2 expr3)
     (if (not (number? expr1)) (display expr1)
     (let ((val expr1))
         (if (not (= val 0)) expr1
           (let ((val expr2))
             (if (not (number? expr2)) (display expr2)
             (if(not (= val 0)) expr2
                (let ((val expr3))
                  (if (not (number? expr3)) (display expr3)
                  (if(not (= val 0)) expr3
                     (display 0))))))))))
     )))


;;; Write a scheme function (tribonacci n).
;;; The tribonacci numbers Ti are defined as
;;; T0 = T1 = 0, T2 = 1, and TN = TN-1 + TN-2 + TN-3. (tribonacci n) should return Tn.
;;; tribonacci and any helper functions must be tail recursive.

(define (tribonacci n) (tri-helper n 0 0 1))

;;helper function for tribonacci

(define (tri-helper n accum0 accum1 accum2)
  (if (or (= n 0) (= n 1)) accum0
      (if (= n 2) accum2
         (let ((m (- n 1)))
               (tri-helper m accum1 accum2 (+ accum0 accum1 accum2))
               ))))















