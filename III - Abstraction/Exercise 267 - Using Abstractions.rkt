;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 267 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [List-of Number] -> [List-of Number]
; Converts a list of US$ amounts into a list of €Euro amounts
(define (convert-euro l)
  (local (; Number -> Number
          ; Convert from dollar to euro
          (define (dollar->euro n)
            (* n (/ 1 1.06))))
    (map dollar->euro l)))


; [List-of Number] -> [List-of Number]
; Converts a list of Fahrenheit measurements to a list of Celsius measurements
(define (convertFC l)
  (local (; Number -> Number
          ; Converts from Gahrenheit to Celsius
          (define (fahrenheit->celsius n)
            (* (- n 32) (/ 5 9))))
    (map fahrenheit->celsius l)))


; [List-of Posn] -> [List-of [List-of NumberPairs]]
; Translates a list of Posns into a list of lists of pairs of numbers
(check-expect (translate (list (make-posn 10 20) (make-posn 40 50))) (list (list 10 20) (list 40 50)))

(define (translate l)
  (local (; Posn -> [List-of NumberPair]
          ; Translates a Posn into a List of NumberPair
          (define (translate1 p)
            (list (posn-x p) (posn-y p))))
    (map translate1 l)))