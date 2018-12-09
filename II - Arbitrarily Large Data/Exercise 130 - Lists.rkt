;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 130 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 130. Create an element of List-of-names that contains five Strings.
; Sketch a box representation of the list similar to those found in figure 44.

(cons "Monday"
      (cons "Tuesday"
            (cons "Wednesday"
                  (cons "Thursday"
                        (cons "Friday" '())))))


; Explain why
(cons "1" (cons "2" '()))
; is an element of List-of-names and why
(cons 2 '())
; isn’t.


; A List-of-names is one of: 
; – '()
; – (cons String List-of-names)
; interpretation a list of invitees, by last name

;; Because 2 is not a string