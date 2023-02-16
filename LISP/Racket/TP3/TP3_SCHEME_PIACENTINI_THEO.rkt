#lang racket

;1. Classe complexe

(define Complexe-1%
  (class object%
    (init-field (a 0)  (b 0))
    (define/public (toString)
      (if (or (= 0 b) (< 0 b))
              (format "~a + ~ai" a b)
              (begin (set! b (- 0 b)) (format "~a - ~ai" a b))))
    (super-new)))

#| tests
(define c1 (new Complexe-1% (a 1) (b 2)))
(send c1 toString)

(define c2 (new Complexe-1%))
(send c2 toString)

(define c3 (new Complexe-1% (a 4) (b -5)))
(send c3 toString)
|#

;2. Classe complexe (suite)

(define Complexe-2%
  (class object%
    (init-field (a 0)  (b 0))
    (define/public (toString)
      (if (or (= 0 b) (< 0 b))
              (format "~a + ~ai" a b)
              (let ([bpp (- 0 b)]) (format "~a - ~ai" a bpp))))
    (define/public (addition ap bp)
      (set! a (+ a ap)) (set! b (+ b bp)))
    (define/public (multiplication ap bp)
      (let ([app a])(set! a (- (* a ap) (* b bp))) (set! b (+ (* app bp) (* ap b)))))
    (super-new)))


#| tests
(define c4 (new Complexe-2% (a 0) (b 1)))
(send c4 toString)
(send c4 multiplication 0 1)
(send c4 toString)
(send c4 multiplication 0 1)
(send c4 toString)
(send c4 multiplication 0 1)
(send c4 toString)
(send c4 multiplication 0 1)
(send c4 toString)
(send c4 addition 3 4)
(send c4 toString)
(send c4 addition 0 -3)
(send c4 toString)
(send c4 multiplication 2 2)
(send c4 toString)
(send c4 multiplication 1/5 0)
(send c4 toString)
(send c4 multiplication 1/4 1/4)
(send c4 toString)
(send c4 multiplication 0 0)
(send c4 toString)
(send c4 addition 1 1)
(send c4 toString)
(send c4 multiplication 2 2)
(send c4 toString)
|#
      
  
;3. Equation du second degré

;1.

(define Eq2Degre-1%
  (class object%
    (init-field (x1 0)  (x2 0) (x3 0))
    (define a x1)
    (define b x2)
    (define c x3)
    (define delta (- (* b b) (* 4 (* a c))))
    (define r1 0)
    (define r2 0)
    (define/public (afficheDiscriminant)
      (printf "discriminant= ~a \n" delta))
    (define/public (resoudre)
      (set! r1 (/ (- (- 0 b)(sqrt delta)) (* 2 a)))
      (set! r2 (/ (+ (- 0 b)(sqrt delta)) (* 2 a))))
    (define/public (afficheSolutions)
      (cond ((< 0 delta) (printf "deux solutions: r1= ~a et r2= ~a \n" r1 r2))
            ((= 0 delta) (printf "une solution: r= ~a \n" r1))
            (#t (display "pas de solution dans l'ensemble des réels \n"))))
    (super-new)))


;2.

(define eq1 (new Eq2Degre-1% (x1 -2) (x2 1)(x3 3)))
(send eq1 afficheDiscriminant)
(send eq1 resoudre)
(send eq1 afficheSolutions)

#| test
(define eq2 (new Eq2Degre-1% (x1 2) (x2 4)(x3 2)))
(send eq2 afficheDiscriminant)
(send eq2 resoudre)
(send eq2 afficheSolutions)
|#

;4. Equation du second degré suite

(define Eq2Degre-2%
  (class Complexe-2%
    (inherit toString)
    (inherit addition)
    (inherit multiplication)
    (inherit-field a b)
    (init-field (x1 0)  (x2 0) (x3 0))
    (define ap x1)
    (define bp x2)
    (define c x3)
    (define delta (- (* bp bp) (* 4 (* ap c))))
    (define r1 0)
    (define r2 0)
    (define/public (afficheDiscriminant)
      (printf "discriminant=~a \n" delta))
    (define/public (resoudre)
      (if (or (< 0 delta) (= 0 delta))
          (begin (set! r1 (/ (- (- 0 bp)(sqrt delta)) (* 2 ap)))(set! r2 (/ (+ (- 0 bp)(sqrt delta)) (* 2 ap))))
          (begin (addition (/ (- 0 bp) (* 2 ap))(- 0(/ (sqrt (- 0 delta)) (* 2 ap)))) (set! r1 (toString))
                 (multiplication 0 0)(addition (/ (- 0 bp) (* 2 ap))(/ (sqrt (- 0 delta))(* 2 ap)))(set! r2 (toString)))))
    (define/public (afficheSolutions)
      (cond ((< 0 delta) (printf "deux solutions: r1= ~a et r2= ~a \n" r1 r2))
            ((= 0 delta) (printf "une solution: r= ~a \n" r1))
            (#t (printf "pas de solution dans l'ensemble des réels, mais deux solutions dans l'ensemble des complexes: r1= ~a et r2= ~a \n" r1 r2))))
    (super-new)))

#| tests
(define eq3 (new Eq2Degre-2% (x1 -2) (x2 1)(x3 3)))
(send eq3 afficheDiscriminant)
(send eq3 resoudre)
(send eq3 afficheSolutions)

(define eq4 (new Eq2Degre-2% (x1 5) (x2 4)(x3 1.25)))
(send eq4 afficheDiscriminant)
(send eq4 resoudre)
(send eq4 afficheSolutions)

(define eq5 (new Eq2Degre-2% (x1 2) (x2 4)(x3 2)))
(send eq5 afficheDiscriminant)
(send eq5 resoudre)
(send eq5 afficheSolutions)
|#