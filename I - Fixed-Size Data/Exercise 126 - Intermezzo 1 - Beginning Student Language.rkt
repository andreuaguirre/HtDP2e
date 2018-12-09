;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 126 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 126. Identify the values among the following
; expressions, assuming the definitions area contains
; these structure type definitions:

(define-struct point [x y z])
(define-struct none  [])


(make-point 1 2 3)
; It's a vaule:
; x for 1
; y for 2
; z for 3

(make-point (make-point 1 2 3) 4 5)
; It's a value:
; x for (make-point 1 2 3)
; y for 4
; z for 5

(make-point (+ 1 2) 3 4)
; It's a value:
; x for 3
; y for 3
; z for 4

(make-none)
; It's a value

(make-point (point-x (make-point 1 2 3)) 4 5)
; It's a value
; (make-point 1 4 5)
; x for (point-x (make-point 1 2 3)) == 1
; y for 4
; z for 5


; Explain why the expressions are values or not.