;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 105 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Coordinate is one of: 
; – a NegativeNumber 
; interpretation on the y axis, distance from top
(define nn1 -5)   ; (0, 5)
(define nn2 -20)  ; (0, 20)

; – a PositiveNumber 
; interpretation on the x axis, distance from left
(define pn1 10) ; (10, 0)
(define pn2 1) ; (1, 0)

; – a Posn
; interpretation an ordinary Cartesian point
(define posn1 (make-posn 10 20)) ; (10, 20)
(define posn2 (make-posn 5 2)) ; (5, 2)