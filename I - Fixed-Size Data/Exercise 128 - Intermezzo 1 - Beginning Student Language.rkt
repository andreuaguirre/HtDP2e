;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 128 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 128. Copy the following tests into DrRacket’s definitions area:

(check-member-of "green" "red" "yellow" "grey")
; "green" is not in "red" "yellow" "grey"

(check-within (make-posn #i1.0 #i1.1)
              (make-posn #i0.9 #i1.2)  0.01)
; not within 0.01

(check-range #i0.9 #i0.6 #i0.8)
; 0.9 not in range of [0.6 0.8]

(check-random (make-posn (random 3) (random 9))
              (make-posn (random 9) (random 3)))
; random posn-x failed

(check-satisfied 4 odd?)
; 4 is not odd


; Validate that all of them fail and explain why.