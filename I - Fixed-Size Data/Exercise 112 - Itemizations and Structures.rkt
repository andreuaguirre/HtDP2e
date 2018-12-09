;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 112 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location
(define MON1 #false)
(define MON2 (make-posn 2 5))

; Checks if missile-or-not? is correct
(check-expect (missile-or-not? #false) #true)
(check-expect (missile-or-not? (make-posn 4 23)) #true)
(check-expect (missile-or-not? #true) #false)
(check-expect (missile-or-not? 2) #false)
(check-expect (missile-or-not? (rectangle 2 3 "solid" "white")) #false)
(check-expect (missile-or-not? "hello world") #false)

(define (missile-or-not? v)
  (cond
    [(or (posn? v) (false? v)) #true]
    [else #false]))