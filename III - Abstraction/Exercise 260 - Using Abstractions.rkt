;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 260 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [NEList-of Number] [Number Number -> Boolean] -> Number
; Determines the smallest or biggest number of a NeLon
(define (inf-sup.v2 l g)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (local ((define smallest-in-rest (inf-sup.v2 (rest l) g)))
       (if (g (first l) smallest-in-rest)
           (first l)
           smallest-in-rest))]))

; [NEList-of Number] -> Number
; Determines the smallest number on l
(check-expect (inf.v2 (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1))
              1)
(check-expect (inf.v2 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25))
              1)

(define (inf.v2 l)
  (inf-sup.v2 l <))

; [NEList-of Number] -> Number
; Determines the biggest number on l
(check-expect (sup.v2 (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1))
              25)
(check-expect (sup.v2 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25))
              25)

(define (sup.v2 l)
  (inf-sup.v2 l >))


; _____________________________________________________________________________



; [NEList-of Number] [Number Number -> Boolean] -> Number
; Determines the smallest or biggest number of a NeLon
(define (inf-sup l f)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (if (f (first l)
            (inf-sup (rest l) f))
         (first l)
         (inf-sup (rest l) f))]))

; [NEList-of Number] -> Number
; Determines the smallest number on l
(check-expect (inf (list 3 2 1)) 1)
(check-expect (inf (list 1 2 3)) 1)

(define (inf l)
  (inf-sup l <))

; [NEList-of Number] -> Number
; Determines the biggest number on l
(check-expect (sup (list 3 2 1)) 3)
(check-expect (sup (list 3 2 1)) 3)

(define (sup l)
  (inf-sup l >))