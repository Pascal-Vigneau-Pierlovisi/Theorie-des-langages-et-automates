#lang racket


(define Complexe-2%
  (class object%
    (init-field (a 0)  (b 0))
    (define/public (toString)(format "~a + ~ai" a b))
    (define/public (addition ap bp)
      (set! a (+ a ap)) (set! b (+ b bp)))
    (define/public (multiplication ap bp)
      (let ([app a])(set! a (- (* a ap) (* b bp))) (set! b (+ (* app bp) (* ap b)))))
    (super-new)))

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
          (begin (addition (/ (- 0 bp) (* 2 ap))(/ (sqrt (- 0 delta)) (* 2 ap))) (set! r1 (toString))
                 (multiplication 0 0)(addition (/ (- 0 bp) (* 2 ap))(- 0(/ (sqrt (- 0 delta))(* 2 ap))))(set! r2 (toString)))))
    (define/public (afficheSolutions)
      (cond ((< 0 delta) (printf "deux solutions: r1=~a et r2=~a \n" r1 r2))
            ((= 0 delta) (printf "une solution: r=~a \n" r1))
            (#t (printf "pas de solution dans l'ensemble des réels, mais deux solution dans l'ensemble des complexes: r1=~a et r2=~a \n" r1 r2))))
    (super-new)))

(define eq2 (new Eq2Degre-2% (x1 -2) (x2 1)(x3 3)))
(send eq2 afficheDiscriminant)
(send eq2 resoudre)
(send eq2 afficheSolutions)

(define eq3 (new Eq2Degre-2% (x1 4) (x2 1)(x3 4)))
(send eq3 afficheDiscriminant)
(send eq3 resoudre)
(send eq3 afficheSolutions)
