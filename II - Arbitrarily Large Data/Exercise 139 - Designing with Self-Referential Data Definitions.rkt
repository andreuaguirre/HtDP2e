;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 139 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A List-of-numbers is one of:
; – '()
; – (cons Number List-of-numbers)
(define List-of-numbers1 '())
(define List-of-numbers2 (cons -2 '()))
(define List-of-numbers3 (cons 3 (cons -2 (cons 4 '()))))


; List-of-numbers -> Boolean
; Determines if all numbers of a given list-of-numbers are positive or not
; Interp: all are PositiveNumbers -> #true
;         some are NegativeNumbers -> #false
(check-expect (pos? '()) #true)
(check-expect (pos? (cons -2 '())) #false)
(check-expect (pos? (cons 3 (cons 2 (cons -1 '())))) #false)
(check-expect (pos? (cons 4 '())) #true)
(check-expect (pos? (cons 2 (cons 4 (cons 5 '())))) #true)

(define (pos? l)
  (cond
    [(empty? l) #true]
    [else (and (positive? (first l))
               (pos? (rest l)))]))


; List-of-numbers -> Number
; Consumes a list-of-numbers
; If all the numbers are positive, computes the sum of the numbers.
; If not, produces an error message.
(check-expect (checked-sum '()) 0)
(check-error (checked-sum (cons -2 '())) "Negative Value")
(check-error (checked-sum (cons 4 (cons 2 (cons -8 '())))) "Negative Value")
(check-expect (checked-sum (cons 4 '())) 4)
(check-expect (checked-sum (cons 2 (cons 6 (cons 8 '())))) 16)

(define (checked-sum l)
  (cond
    [(pos? l) (sum l)]
    [else (error "Negative Value")]))


; List-of-amounts -> PositiveNumber
; Consumes a list-of-amounts and determines the sum of the amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 25 '())) 25)
(check-expect (sum (cons 10 (cons 20 (cons 5 '())))) 35)

(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum (rest l)))]))