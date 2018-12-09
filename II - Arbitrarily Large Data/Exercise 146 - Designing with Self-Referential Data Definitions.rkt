;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 146 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; NEList-of-temperatures -> Number
; computes the average temperature 
(check-expect (average (cons 10 (cons 20 '()))) 15)
(check-expect (average (cons -10 (cons 9 (cons 25 '())))) 8)
(check-expect (average (cons 4 '())) 4)

(define (average ne-l)
  (/ (sum ne-l)
     (how-many ne-l)))



; NEList-of-temperatures -> Number 
; adds up the temperatures on the given list
(check-expect (sum (cons 2 '())) 2)
(check-expect (sum (cons 23 (cons 1 (cons -2 '())))) 22)

(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))

; NEList-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 2 '())) 1)
(check-expect (how-many (cons 5 (cons -12 (cons 2 '())))) 3)

(define (how-many ne-l)
  (cond
    [(empty? (rest ne-l)) 1]
    [else (+ (how-many (rest ne-l)) 1)]))


; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 
(define ne-l1 (cons 4 '()))
(define ne-l2 (cons 10 (cons -2 '())))