;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 253 - Designing Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [Number -> Boolean]
(check-expect (number? 5) #true)

; [Boolean String -> Boolean]
(check-expect (equal? #true "abde") #false)

; [Number Number Number -> Number]
(check-expect (+ 1 2 3) 6)

; [Number -> [List-of Number]]
(check-expect (list 5) (list 5))

; [[List-of Number] -> Boolean]
(check-expect (list? '(1 2 3 4)) #true)