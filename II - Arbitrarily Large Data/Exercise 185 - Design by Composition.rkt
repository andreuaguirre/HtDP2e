;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 185 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 185. You know about first and rest from BSL, but BSL+ comes
; with even more selectors than that.
; Determine the values of the following expressions:

; 1.
(check-expect (first (list 1 2 3))
              1)


; 2.
(check-expect (rest (list 1 2 3))
              (list 2 3))


; 3.
(check-expect (second (list 1 2 3))
              2)


(check-expect (third (list 1 2 3))
              3)


(check-expect (fourth (list 1 2 3 4))
              4)