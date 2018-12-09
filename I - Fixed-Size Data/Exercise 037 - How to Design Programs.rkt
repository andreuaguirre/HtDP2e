;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 37 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; string -> string
; removes the first character of a string str
; given: "abcde" expect: "bcde"
; if there's no characters, stays the same
(check-expect (string-rest "abc") "bc")
(check-expect (string-rest "a") "")
(check-expect (string-rest "") "")

(define (string-rest str)
  (if
   (>= (string-length str) 1)
   (substring str 1)
   str))