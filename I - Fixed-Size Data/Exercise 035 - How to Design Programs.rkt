;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 35 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; string -> string
; extracts de last character of a string str
; given: "abcd" expected: "d"
(check-expect (string-last "abcd") "d")
(check-expect (string-last "a") "a")
(check-expect (string-last "") "")

(define (string-last str)
  (if
   (>= (string-length str) 1)
   (substring str (- (string-length str) 1)
                   (string-length str))
   str))