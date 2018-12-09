;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 137 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 137. Compare the template for contains-flatt? with the one for how-many.
; Ignoring the function name, they are the same. Explain the similarity. 

; List-of-names -> Boolean
; Determines if the string "Flatt" is on a given list of names
; Template
(define (contains-flatt? alon)
  (cond
    [(empty? alon) ...]
    [(cons? alon)
     (... (first alon) ...
      ... (contains-flatt? (rest alon)) ...)]))

; List-of-strings -> Number
; Determines how many strings are on alos
; Template
(define (how-many alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ...
      ... (how-many (rest alos)) ...)]))