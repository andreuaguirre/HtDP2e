;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 34 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; string -> string
; extracts the first character from a string
; given: "abcd", expect: "a"
(check-expect (string-first "abc") "a")
(check-expect (string-first "a") "a")
(check-expect (string-first "") "")

(define (string-first str)
  (if
   (>= (string-length str) 1)
   (substring str 0 1)
   str))