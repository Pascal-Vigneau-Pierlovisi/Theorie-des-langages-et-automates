#lang racket

(define Eq2Degre%
  (class object%
    (init-field (x1 0)  (x2 0) (x3 0))
    (define a x1)
    (define b x2)
    (define c x3)
    (define delta (- (* b b) (* 4 (* a c))))
    (define r1 0)
    (define r2 0)
    (define/public (afficheDiscriminant)
      (printf "discriminant=~a \n" delta))
    (define/public (resoudre)
      (set! r1 (/ (- (- 0 b)(sqrt delta)) (* 2 a)))
      (set! r2 (/ (+ (- 0 b)(sqrt delta)) (* 2 a))))
    (define/public (afficheSolutions)
      (cond ((< 0 delta) (printf "deux solutions dans l'ensemble des réels: r1=~a et r2=~a \n" r1 r2))
            ((= 0 delta) (printf "une solution dans l'ensemble des réels: r=~a \n" r1))
            (#t (display "pas de solution dans l'ensemble des réels \n"))))
    (super-new)))

(define eq (new Eq2Degre% (x1 -2) (x2 1)(x3 3)))
(send eq afficheDiscriminant)
(send eq resoudre)
(send eq afficheSolutions)

(define eq2 (new Eq2Degre% (x1 2) (x2 4)(x3 2)))
(send eq2 afficheDiscriminant)
(send eq2 resoudre)
(send eq2 afficheSolutions)

(define eq3 (new Eq2Degre% (x1 3) (x2 4)(x3 2)))
(send eq3 afficheDiscriminant)
(send eq3 resoudre)
(send eq3 afficheSolutions)

(define eq4 (new Eq2Degre% (x1 2) (x2 4)(x3 -5)))
(send eq4 afficheDiscriminant)
(send eq4 resoudre)
(send eq4 afficheSolutions)



    