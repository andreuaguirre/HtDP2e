;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 140 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-boolean -> Boolean
; Consumes a list-of-boolean and determines whether all of them are #true.
; Interp: If there is any #false boolean, #false
;         If not, #true
(check-expect (all-true '()) #true)
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #false '())) #false)
(check-expect (all-true (cons #true (cons #true (cons #true '())))) #true)
(check-expect (all-true (cons #true (cons #false (cons #true '())))) #false)

(define (all-true l)
  (cond
    [(empty? l) #true]
    [else (and (first l)
               (all-true (rest l)))]))

; List-of-boolean -> Boolean
; Consumes a list-of-boolean and determines if one of them is #true.
; Interp: If there is any #true boolean, #true
;         If not, #false
(check-expect (one-true '()) #false)
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #false (cons #true (cons #false '())))) #true)
(check-expect (one-true (cons #false (cons #false (cons #false '())))) #false)

(define (one-true l)
  (cond
    [(empty? l) #false]
    [else (or (first l)
               (one-true (rest l)))]))

; A list-of-boolean is one of:
; - '()
; - (cons Boolean list-of-boolean)
(define list-of-boolean1 '())
(define list-of-boolean2 (cons #true (cons #false '())))