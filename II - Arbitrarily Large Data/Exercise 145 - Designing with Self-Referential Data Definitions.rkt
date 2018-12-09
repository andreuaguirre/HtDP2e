;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 145 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; NEList-of-temperatures -> Boolean
; If the temperatures are sorted in descending order, #true
; If not, #false
(check-expect (sorted>? (cons 5 '())) #true)
(check-expect (sorted>? (cons 10 (cons 6 (cons 2 '())))) #true)
(check-expect (sorted>? (cons 3 (cons 10 '()))) #false)

(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else (and (> (first ne-l) (first (rest ne-l)))
               (sorted>? (rest ne-l)))]))



; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 
(define ne-l1 (cons 4 '()))
(define ne-l2 (cons 10 (cons -2 '())))