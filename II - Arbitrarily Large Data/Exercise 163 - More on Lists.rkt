;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 163 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Cons -> Cons
; Converts a list-of-temperatures in Fahrenheit to a list-of-temperatures on Celsius.
(check-expect (convertfc '()) '())
(check-expect (convertfc (cons 86 (cons 59 '()))) (cons 30 (cons 15 '())))

(define (convertfc lot)
  (cond
    [(empty? lot) '()]
    [else (cons (ftc (first lot)) (convertfc (rest lot)))]))


; Number -> Number
; Converts a temperature from Fahrenheit to Celsius.
(check-expect (ftc 86) 30)
(check-expect (ftc 14) -10)
(check-expect (ftc 68) 20)

(define (ftc ft)
  (/ (- ft 32) 1.8))


; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
(define lot1 '())
(define lot2 (cons 23 (cons 1 '())))