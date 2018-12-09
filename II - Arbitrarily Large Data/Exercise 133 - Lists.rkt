;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 133 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 133. Here is another way of formulating the second cond clause in contains-flatt?:

... (cond
      [(string=? (first alon) "Flatt") #true]
      [else (contains-flatt? (rest alon))]) ...

; Explain why this expression produces the same answers as the
; or expression in the version of figure 47. Which version is better? Explain.

;; It's the same expression. Using the primitive or expression shortens the program.