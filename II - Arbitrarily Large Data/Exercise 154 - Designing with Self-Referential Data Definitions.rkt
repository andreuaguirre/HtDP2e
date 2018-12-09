;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 154 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; RD -> String
; Produces a string of all RD colors, separated by a comma and a space.
(check-expect (colors "yellow") "yellow")
(check-expect (colors (make-layer "yellow" "green")) "yellow, green")
(check-expect (colors (make-layer "yellow" (make-layer "green" "red"))) "yellow, green, red")

(define (colors rd)
  (cond
    [(string? rd) rd]
    [(layer? rd) (string-append (layer-color rd) ", " (colors (layer-doll rd)))]))


; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)
(define-struct layer [color doll])

(define RD1 "orange")
(define RD2 (make-layer "black" (make-layer "red" "green")))