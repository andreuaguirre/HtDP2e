;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 38 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; string -> string
; removes the last character of a string str
; if it has no characters, stays the same
; given: "abcde" expect: "abcd"
(check-expect (string-remove-last "abcde") "abcd")
(check-expect (string-remove-last "a") "")
(check-expect (string-remove-last "") "")

(define (string-remove-last str)
  (if
   (>= (string-length str) 1)
   (substring str 0 (- (string-length str) 1))
   str))