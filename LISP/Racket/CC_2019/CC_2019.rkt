;1.

(define (moyenne a b c)
  (/ (+ (+ a b) c) 3))

(moyenne 1 2 3)
(moyenne 1 3 3)
(moyenne 20 40 60)

;2.

(define (CARRE a)
  (* a a))

(CARRE 2)
(CARRE 3)
(CARRE 4)

;3.

(define (DER L)
  (if (null? (cdr L)) ; on peut aussi simplement utiliser (last L)... mais c'est moins marrant
      L ;ou (car L) si l'on veut juste le nombre
      (DER(cdr L))))

(DER '(1 2 3))
(DER '(1 2 3 4 5 6 7 20))

;4.
(define (singleton? L)
  (if (= (length L) 1)
      #t
      #f))
(singleton? '(1))
(singleton? '())
(singleton? '(1 2))

;5.
(define (secondbis L)
  (cadr L))

(second '(1 2 3))

;6.
(define (take L k)
  (if (> k 0)
      (cons (car L) (take (cdr L) (- k 1)))
      '()))

(take '(1 2 3) 0)
(take '(1 2 3) 1)
(take '(1 2 3) 2)
(take '(1 2 3) 3)

;7.
(define (drop L k)
  (if (> k 0)
      (drop (cdr L) (- k 1))
      L))

(drop '(1 2 3) 0)
(drop '(1 2 3) 1)
(drop '(1 2 3) 2)
(drop '(1 2 3) 3)

;8.
(define (ajoute10 L)
  (map (lambda (L) (+ L 10))
       L))

(ajoute10 '(20 25 30))

;9.
(define (VALIS  L)
  (map (lambda (L)  (eval L))
       L))

(VALIS '((car '(1 2)) "oo" (* 4 5)))

;10.
(define (Aconst L1 L2)
  (map (lambda (L1 L2) (list L1 L2))
       L1 L2))

(Aconst  '(manu liverpool salford) '(20 40 50))
