;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 255 - Designing Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 255. Formulate signatures for the following functions:

; - map-n, which consumes a list of numbers and a function
; from numbers to numbers to produce a list of numbers.

;; [List-of Number] [Number -> Number] -> [List-of Number]



; map-s, which consumes a list of strings and a function
; from strings to strings and produces a list of strings.

;; [List-of String] [String -> String] -> [List-of String]



; Then abstract over the two signatures, following the above steps.

;; [X] [List-of X] [X -> X] -> [List-of X]