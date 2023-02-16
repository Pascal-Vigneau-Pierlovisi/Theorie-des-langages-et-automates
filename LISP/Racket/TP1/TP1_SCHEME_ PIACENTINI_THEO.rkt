
;Exercice 1
(display "\nExercice 1\n")

;1.
;(+ 1 3)
;l'expression n'est pas transformable

;2.
;'(+ 1 3)
;l'expression n'est pas transformable

;3.
;(quote(+ 1 3))
;l'expression n'est pas transformable

;4.
;(car'(1 2 3))
;l'expression n'est pas transformable

;5.
;(car'(2))
;l'expression n'est pas transformable

;6.
;(cdr'(2))
;l'expression n'est pas transformable

;7.
;(cdr'(1 2 3))
;l'expression n'est pas transformable

;8.
;(cdr(+ 1 6))
;l'expression n'est pas correct

;9.
;(car'((a b) c (d e)))
;l'expression n'est pas transformable

;10.
;(cdr'((a b) c (d e)))
;l'expression n'est pas transformable

;11.
(car(cdr'((a b) c d)))
(cadr'((a b) c d))

;12.
;(cdr(car(cdr'((a b) c d))))
;(cdadr'((a b) c d))
;mais l'expression de base n'est pas correct

;13.
(car(cdr'(a b c)))
(cadr'(a b c))

;14.
;(car'(cdr'(a b c)))
;l'expression n'est pas transformable

;15.
(car(cdr(car'((a b) c d))))
(cadar'((a b) c d))

;16.
;(car(quote(b c)))
;l'expression n'est pas transformable

;17.
;(cdr(quote(b c)))
;l'expression n'est pas transformable

;18.
;(car'())
;l'expression n'est pas correct

;19.
;(cdr'())
;l'expression n'est pas correct

;20.
;(car(cdr'(1)))
;(cadr'(1))
;mais l'expression de base n'est pas correct

;21.;
;(cdr(cdr'(10)))
;(cddr'(10))
;mais l'expression de base n'est pas correct


;Exercice 2
(display "\nExercice 2\n")

(define l1 '(scheme est un langage))
(define l2 '(((((comprenez)vous)tout)cela)?))
(define l3 '((A B) C (1 4 3(2))))



;1.
(cadddr l1)

;2.
(cddr l1)

;3.
(car(caaaar l2))

;4.
(cdar l2)

;5.
(cadr l3)

;6.
(cadr l1)

;7.
(cddddr l1)
(cddar l2)
(cdddr l3)

;8.
(cadr l2)

;9.
(caddr l3)

;10.
(caddr(cdaddr l3))

;11.
(car l1)

;12.
(caaar l2)

;13.
(cdaar l2)

;14.
(cadar l3)

;15.
(car l3)


;Exercice 3
(display "\nExercice 3\n")

;3.1
(display "\n3.1\n")

;(define 1'(1 2 (3 (4) 5)6(7 8)9))

;1.
(cons(car'(1 2 (3 (4) 5)6(7 8)9))(caddr'(1 2 (3 (4) 5)6(7 8)9)))

;2.
(cons(cadddr'(1 2 (3 (4) 5)6(7 8)9))(cons(car'(1 2 (3 (4) 5)6(7 8)9))'()))


;3.2
(display "\n3.2\n")

         
;1.
(cadar'((B A Z)))

;2.
(cadadr'(Z (B A) (R T)))


;3.3
(display "\n3.3\n")

;Exemple
;(cons 'a (cons (cons 'b '()) '()))

;1.
(cons(cons 'a '())(cons 'b (cons 'g '())))

;2.
(cons(cons 'a '())(cons(cons 'b (cons 'g '()))'()))


(display "\n3.4\n")
;3.4
(define (somme L)
  (if (null? L)
      0
      (+ (car L) (somme (cdr L)))))
      
(display "donnez moi une liste, je ferai la somme de tous ses éléments: ")
(somme (read))

(display"\n")

;Exercie 4

;1.
(define (AireCercle x)
  (* 3.14 (* x x)))

;2.
(define (ValeureAbsolue x)
  (sqrt(* x x)))


;Exercice 5


;1.
(define (permutation-2-elt L)
  (list (cadr L) (car L)))

;2.
(define (sauf-dernier L)
  (if (< 1 (length L))
     (reverse(cdr(reverse L)))
     '()))

;Exercice 6

;1.
(define (f x)
  (sqrt(+ 1 (sqrt(+ 2 (sqrt(+ 3 x)))))))


;2.
(define (g x)
  (sqrt(+ 1 (sqrt(+ 2 (sqrt(+ 3 (sqrt(+ 4 (sqrt(+ 5 (sqrt(+ 6 x)))))))))))))


;3.
(define (h x)
  (+ 1 (+ (sqrt(+ 3 (/ 7 x))) (+ (log(+ 1 (sqrt(+ 3 (/ 7 (* 2 x)))))) -4))))


;Exercice 7

;1.
(define (premier L)
    (car L)) 

;2.
(define (second-bis L)
    (cadr L))

;3.
(define (sauf_premier L)
  (cdr L))

;4.
(define (construit x L)
    (cons x L))

;5.
(define (singleton? L)
  (if (= 1 (length L))
      #t
      #f))

;6-1.
(define (decalage_gauche L)
  (append (cdr L) (list(car L))))

;6-2.
(define (decalage_droite L)
  (cons (car (reverse L)) (reverse(cdr(reverse L)))))


;Exercice 8

;1.
(define (le_plus_grand x y)
  (if (< x y)
      y
      x))

;2.
(define (signe x)
  (cond ((< x 0)"negatif")
        ((> x 0)"positif")
        (#t "nul")))

;3.
(define (ou_ex p q)
  (if (or (and (eq? p #t)(eq? q #f)) (and (eq? p #f)(eq? q #t)))
      #t
      #f))

;4.
(define (ValeurAbsolue x)
  (sqrt(* x x)))
(define (AireCercle x)
  (* 3.14 (* x x)))
(define (AireCouronne R1 R2)
  (ValeurAbsolue(- (AireCercle R2)(AireCercle R1))))
    
;5.
(define (Vin1 p q)
  (if (<= (* p q) 500)
      (* p q)
      (+ (/ (* p q) 10) (* p q))))
    
;6.
(define (Vin2 p q)
  (if (<= (* p q) 10)
      (+ (* p q) 10)
      (+ (* p q) (/ (* p q) 10) )))


;Exercice 9

;a)
(define (k2 x)
  2)

;b)
(define (id x)
  x)

;c)
(define (proj2 x y)
  y)

;d)
(define (distance x1 y1 x2 y2)
  (sqrt(+ (* (- x1 x2) (- x1 x2))(* (- y1 y2) (- y1 y2)))))

;Exercice 10

;a)
(define (max3 a b c)
  (if (< b a)
      (if (< c a)
          a
          c)
      (if (< c b)
          b
          c)))

;b)
(define (max4 a b c d)
  (if (< b a)
      (if (< c a)
          (if (< d a)
              a
              d)
          (if (< d c)
               c
               d))
       (if (< c b)
          (if (< d b)
              b
              d)
          (if (< d c)
               c
               d))))


