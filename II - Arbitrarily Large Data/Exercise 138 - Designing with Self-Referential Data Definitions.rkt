;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 138 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)
(define ListOfAmounts1 '())
(define ListOfAmounts2 (cons 5 '()))
(define ListOfAmounts3 (cons 29 (cons 5 (cons 123 '()))))

; List-of-amounts -> PositiveNumber
; Consumes a list-of-amounts and determines the sum of the amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 25 '())) 25)
(check-expect (sum (cons 10 (cons 20 (cons 5 '())))) 35)

(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum (rest l)))]))