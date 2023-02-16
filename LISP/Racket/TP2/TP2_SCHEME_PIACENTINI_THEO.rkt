;1. Exercices sur les ensembles

;a-
(define (1er_elementL1_dans_L2? L1 L2)
  (cond ((null? L2)#f)
        ((equal? (car L1) (car L2)) #t)
        (#t (1er_elementL1_dans_L2? L1 (cdr L2)))))

(define (union L1 L2)
  (cond ((null? L2) L1)
        ((not (1er_elementL1_dans_L2? L2 L1)) (append (union L1 (cdr L2)) (list (car L2))))
        (#t (union L1 (cdr L2)))))

;b-
(define (1er_elementL1_dans_L2? L1 L2)
  (cond ((null? L2)#f)
        ((equal? (car L1) (car L2)) #t)
        (#t (1er_elementL1_dans_L2? L1 (cdr L2)))))

(define (inter L1 L2)
  (cond ((null? L1)'())
        ((1er_elementL1_dans_L2? L1 L2) (cons (car L1) (inter (cdr L1) L2)))
        (#t (inter (cdr L1) L2))))


;2.twice
(define (twice L)
  (map (lambda (L)
         (* 2 L))
       L))


;3. merge
(define (produit L)
  (if (null? L)
      1
      (* (car L) (produit (cdr L)))))
      
(define (merge L1 L2)
  (produit (map (lambda (L1 L2)(+ L1 L2))
       L1 L2)))


;4. Compare-liste
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))

(define (compare-liste L1 L2)
  (count #t (map (lambda (L1 L2)(equal? L1 L2))
       L1 L2)))


;5. Count
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))


;6. Compt
(define (Compt L)
  (cond ((null? L) 0)
        ((even? (car L)) (+ 1 (Compt (cdr L))))
        (#t (Compt (cdr L)))))


;7. Max-sous-liste
;a-reccursive
(define (Max-sous-liste1 L)
  (cond ((= (length L) 1) (length (car L)))
        ((< (length (cadr L))(length (car L)))(Max-sous-liste1 (cons (car L)(cddr L))))
        (#t (Max-sous-liste1 (cdr L)))))

;b-map et apply
(define (Max-sous-liste2 L)
  (apply max(map (lambda (L)
                   (length L))
                 L)))


;8. NBDIST
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))

(define (NBDIST L)
  (cond ((null? L) 0)
        ((= 1 (count (car L) L)) (+ 1 (NBDIST (cdr L))))
        (#t (NBDIST (cdr L)))))


;9.
;a- Notre-append
(define (Notre-append L1 L2)
  (if (null? L1)
      L2
      (cons (car L1) (Notre-append (cdr L1) L2))))

;b- VALIS
(define (valis L)
  (map (lambda (L)
         (eval L))
       L))


;10. Remove-first
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))

(define (remove-first x L)
  (cond ((= 0 (count x L)) L)
        ((equal? x (car L))(cdr L))
        (#t (cons (car L) (remove-first x (cdr L))))))


;11. Remove-all
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))

(define (remove-all x L)
  (cond ((= 0 (count x L)) L)
        ((equal? x (car L))(remove-all x (cdr L)))
        (#t (cons (car L) (remove-all x (cdr L))))))


;12. Remove-k-first
(define (count x L)
  (cond ((null? L) 0)
        ((equal? x (car L)) (+ 1 (count x (cdr L))))
        (#t (count x (cdr L)))))

(define (remove-first x L)
  (cond ((= 0 (count x L)) L)
        ((equal? x (car L))(cdr L))
        (#t (cons (car L) (remove-first x (cdr L))))))

(define (remove-k-first x n L)
  (if (= 0 n)
      L
      (remove-k-first x (- n 1) (remove-first x L))))
      

;13. Notre-reverse
(define (reverse-bis L1 L2)
  (if (null? L1)
      L2
      (reverse-bis (cdr L1) (cons (car L1) L2))))

(define (Notre-reverse L1)
  (reverse-bis L1 '()))


;14. Alternate
(define (alternate L)
  (cond((null? L) '())
       ((= 1 (length L)) L)
       (#t (cons (cadr L) (cons (car L) (alternate (cddr L))))))) 


;15. Longest
(define (longest L)
  (cond ((= (length L) 1) (car L))
        ((< (length (cadr L))(length (car L)))(longest (cons (car L)(cddr L))))
        (#t (longest (cdr L)))))


;16. Stammer-n
(define (duplication x n)
  (if (= n 0)
      '()
      (cons x (duplication x (- n 1)))))

(define (stammer-n L n)
  (apply append (map (lambda (L)
                      (duplication L n))
                    L)))


;17. Listref
(define (listref L n)
  (if (= 0 n)
      (car L)
      (listref (cdr L) (- n 1))))


;18. List-Tail
(define (list-tail-bis L n)
  (if (= 0 n)
      L
      (list-tail-bis (cdr L) (- n 1))))


;19. recherche de doublons
(define (1er_elementL1_n-fois_dans_L2? L1 L2 n)
  (cond ((= n 0) #t)
        ((null? L2)#f)
        ((equal? (car L1) (car L2)) (1er_elementL1_n-fois_dans_L2? L1 (cdr L2) (- n 1)))
        (#t (1er_elementL1_n-fois_dans_L2? L1 (cdr L2) n))))

(define (sous-doublon L1 L2)
  (cond ((null? L1) '())
        ((1er_elementL1_n-fois_dans_L2? L1 L2 2)(cons (car L1)(sous-doublon (cdr L1) L2))) 
        (#t (sous-doublon (cdr L1) L2))))

(define (doublon L1)
  (sous-doublon L1 L1))


;20. Odds
(define (odds L)
  (cond ((null? L) '())
        ((< 1 (length L))  (cons (car L) (odds(cddr L))))
        (#t(cons (car L) (odds (cdr L))))))


;21. Follow
(define (follow x L)
  (cond ((null? L) '())
        ((equal? x (car L))(if (< 1 (length L))
                               (cons (cadr L) (follow x (cdr L)))
                               '(())))
        (#t(follow x (cdr L)))))
  

;22. Precede
(define (follow x L)
  (cond ((null? L) '())
        ((equal? x (car L))(if (< 1 (length L))
                               (cons (cadr L) (follow x (cdr L)))
                               '(())))
        (#t(follow x (cdr L)))))

(define (precede x L)
  (reverse(follow x (reverse L))))
  

;23. Collect-number
(define (sous-collect-number L)
  (cond ((null? L) '())
        ((number? L) (list L))
        ((null? (car L)) (sous-collect-number (cdr L)))
        ((pair? (car L)) (append (sous-collect-number(car L))(sous-collect-number (cdr L))))
        ((number? (car L)) (cons (car L) (sous-collect-number (cdr L))))
        (#t (sous-collect-number (cdr L)))))

(define (collect-number L)
  (if (null? (sous-collect-number L))
      (display"NIL\n")
      (sous-collect-number L)))


;24. deep-map
(define (deep-map f L)
  (cond ((null? L) '())
        ((pair? (car L)) (append (list (deep-map f (car L)))(deep-map f (cdr L))))
        (#t (cons (f (car L)) (deep-map f (cdr L))))))



;25. Permutation

;Cette question étant plus complexe que les autres présentes sur le TD, je vais décrire chaque sous-fonction utilisée.

(define (mille-feuille-bis x L1 L2)
  (if (null? L1)
      (list (reverse (cons x (reverse L2))))
      (cons (append L2 (cons x L1)) (mille-feuille-bis x (cdr L1) (reverse(cons (car L1) (reverse L2)))))))

;La fonction mille-feuille-bis créée une liste de toutes les listes que l'on peut produire en inserant un singleton x dans une liste L1


(define (mille-feuille x L)
  (mille-feuille-bis x L '()))

;mille-feuille n'est là que pour alléger la présentation en enlevant la liste vide présente dans les variables de mille-feuille-bis

(define (map-mille-feuille x L)
  (apply append (map (lambda (L)
                       (mille-feuille x L))
                     L)))

#|
map-mille-feuille applique la fonction mille-feuille à toutes les listes présentes dans une liste L et créée en resultat
une liste des listes obtenues en les mettant au même niveau
|#

(define (sous-permute-bis x L)
  (cond ((null? L) (cons x '()))
        ((= 1 (length L)) (mille-feuille x L))
        (#t (map-mille-feuille x L))))

#|
sous-permute-bis applique map-mille-feuille si la liste a plus de deux éléments, mille-feuille si elle n'en a qu'un seul (map-mille-feuille
n'étant plus utile) et créée une liste avec x si la liste est vide.
|#

(define (permute-bis L1 L2)
  (if (null? L1)
      L2
      (permute-bis (cdr L1) (sous-permute-bis (car L1) L2))))
#|
permute-bis applique sous-permute-bis à une liste vide avec le premier terme de L1 puis applique sous-permute-bis au resultat obtenu précedemment
avec le deuxième terme de L1 et ainsi de suite jusqu'au dernier terme de L1
|#
  
(define (permute L)
  (if (= 1 (length L))
      (list L)
      (reverse (permute-bis L '()))))

#|
Permute gére l'exception des listes données en variable constituées d'un seul élément qui doivent apparaitre dans une liste d'après les exemples
de l'énoncé. Si la liste a plus d'un élément alors il applique permute-bis et inverse le resultat, ce n'est là que pour des raisons de présentation,
grâce à cela, la liste de listes donnée en résultat commence par la liste L. De plus cette fonction enlève la liste vide présente en variable
dans permute-bis.
|#