;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 241 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation: non-empty list of Celsius temperatures 
(define NELT1 (cons 20 '()))
(define NELT2 (cons 5 (cons 10 '())))

; An NEList-of-Booleans is one of: 
; – (cons Boolean '())
; – (cons Boolean NEList-of-Booleans)
; interpretation: non-empty list of Boolean values
(define NELB1 (cons #true '()))
(define NELB2 (cons #true (cons #false '())))

;__________________________________________________________

; A NEList-of is one of:
; - (cons ITEM '())
; - (cons ITEM NEList-of)
; interpretation: non-empty list of items


; A [NEList-of CTemperatures] is one of:
; - (cons CTemperature '())
; - (cons CTemperature [NEList-of Ctemperatures])
(define NEL-T1 NELT1)
(define NEL-T2 NELT2)

; A [NEList-of Booleans is one of:
; - (cons Boolean '())
; - (cons Boolean [NEList-of Booleans])
(define NEL-B1 NELB1)
(define NEL-B2 NELB2)