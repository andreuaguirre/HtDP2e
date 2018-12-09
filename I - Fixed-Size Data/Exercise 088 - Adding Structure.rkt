;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 88 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; vcat is a structure
; (make-vcat (Number Number))
; x-coord for the x-coordinate of the cat
; happiness for the happiness of the cat
(define-struct vcat [x-coord happiness])

(define CAT1 (make-vcat 0 100))
(define CAT2 (make-vcat 50 50))

; template
(define (fn-vcat x)
  (... (... (vcat-x-coord x)
       (... (vcat-happiness x)))))