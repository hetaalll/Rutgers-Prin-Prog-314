;; 1.  a b c --> a a b b c c
;;     a (b c) --> a a (b c) (b c)

(define (echo lst)
  (if (null? lst) '()
  (cons (car lst) (cons (car lst) (echo (cdr lst)))) );;print first element twice, then call the function again on the rest of the list
 ) ;;end define 


;; 2. a (b c) 3 --> (a a a (b c) (bc) (bc))

(define (echo-lots lst n)
  (if (null? lst) '()
      (let loop ((i (- n 1)) (lt (car lst)))   ;; loop for n-1 times and print the first element
        (if (zero? i)
            (cons lt (echo-lots (cdr lst) n))  ;;if i==0; start again with the rest of the list
            (cons lt (loop (- i 1) lt))))))    ;; else loop till i==0

;; 3. (a (b c)) --> (a a (b b c c) (b b c c))

(define (echo-all lst)
  (if (null? lst) '()
      (if (not (list? (car lst))) ;;end not
          (cons (car lst) (cons (car lst) (echo-all (cdr lst) ) ) ) ;;if not a list, print first element twice, call the function on rest of the list
          ;;end first cons if not a list
          (cons (echo (car lst)) (cons (echo (car lst)) (echo-all (cdr lst))) ) ) ) ;;if list, duplicate list, then duplicate inside
          ;;then call the function of the rest of the list
 ) ;;end define


;; 4. (nth 0 '(a b c)) --> a

(define (nth i lst)
  (if (null? lst) '()
  (if(= i 0) (car lst) ;;is it the first element?
     (nth (- i 1) (cdr lst))));;no? go to the rest of the list
 ) ;;end define

;;5.  (assoc-all '(a d c d) '((a apple)(b boy)(c (cat cow))(d dog)))

(define assoc-all (lambda (keys a-list)
   (if(null? keys) '()   ;;if keys is null
      (map (lambda (keys)
         (if(not(assoc keys a-list)) '()  ;;if a certain key is not present
         (cadr(assoc keys a-list)))) keys)))) ;;cadr to get apple from (a apple)

;;6. filter even numbers out '(3 4 5) --> (4)

(define (filter fn lst)
  (if (null? lst) '()
      (if(fn(car lst)) (cons (car lst) (filter fn (cdr lst))) ;;if #t for fn, then add to the output
         (filter fn (cdr lst)));else go to the rest of the list
 ));end define
