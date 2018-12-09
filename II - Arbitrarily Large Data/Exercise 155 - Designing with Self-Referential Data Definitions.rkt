;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 155 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; RD -> String
; Produces the color string of the innermost doll.
(check-expect (inner "yellow") "yellow")
(check-expect (inner (make-layer "yellow" "green")) "green")
(check-expect (inner (make-layer "yellow" (make-layer "green" (make-layer "red" "black")))) "black")

(define (inner rd)
  (cond
    [(string? rd) rd]
    [(layer? rd) (inner (layer-doll rd))]))


; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)
(define-struct layer [color doll])

(define RD1 "orange")
(define RD2 (make-layer "black" (make-layer "red" "green")))