;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 143 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-temperatures -> Number
; computes the average temperature
(check-error (checked-average '()) "Invalid input")
(check-expect (checked-average (cons 10 (cons 20 '()))) 15)
(check-expect (checked-average (cons -10 (cons 9 (cons 25 '())))) 8)
(check-expect (checked-average (cons 4 '())) 4)

(define (checked-average alot)
  (if
   (equal? alot '())
   (error "Invalid input")
   (/ (sum alot) (how-many alot))))



; List-of-temperatures -> Number 
; adds up the temperatures on the given list
(check-expect (sum '()) 0)
(check-expect (sum (cons 2 '())) 2)
(check-expect (sum (cons 23 (cons 1 (cons -2 '())))) 22)

(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))

; List-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many '()) 0)
(check-expect (how-many (cons 2 '())) 1)
(check-expect (how-many (cons 5 (cons -12 (cons 2 '())))) 3)

(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [else (+ (how-many (rest alot)) 1)]))


; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
; A CTemperature is a Number greater than -273.
(define list-of-temperatures1 '())
(define list-of-temperatures2 (cons 2 (cons -32 '())))