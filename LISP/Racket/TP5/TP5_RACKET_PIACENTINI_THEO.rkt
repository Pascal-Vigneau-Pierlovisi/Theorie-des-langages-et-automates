#lang racket

(begin (require ppict/2 ppict/slideshow2)
       (with-text-style
        #:defaults (#:face "Fira Sans, Condensed")
        ([h #:size 70]
         [t #:size 50 #:face "Fira Sans, Light"])

        (pslide #:go (coord 0.1 0.1 'lt)
                (h "Research idea")
                #:go (coord 0.2 0.5 'lc)
                (y "a DSL for standard fishes")
                #:go (coord 0.8 0.8)
                (standardfish 200 100 #:color "tomato"))))
                
