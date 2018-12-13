;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 239 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A [List X Y] is a structure: 
;   (cons X (cons Y '()))

; Instantiate this definition to describe the following classes of data:

; - pairs of Numbers,
; - pairs of Numbers and 1Strings, and
; - pairs of Strings and Booleans.



; A [List Number Number] is a structure
; (cons N (cons N '()))
(cons 1 (cons 2 '()))


; A [List Number 1String] is a structure
; (cons N (cons 1String '()))
(cons 23 (cons "a" '()))


; A [List String Boolean] is a structure
; (cons String (cons Boolean '()))
(cons "yellow" (cons #true '()))