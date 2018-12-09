;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 79 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Color is one of:
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"
(check-expect (COLOR -20) "black")
(check-expect (COLOR 0) "white")
(check-expect (COLOR 19) "yellow")
(check-expect (COLOR 20) "orange")
(check-expect (COLOR 34) "green")
(check-expect (COLOR 49) "red")
(check-expect (COLOR 59) "blue")


(define (COLOR x)
  (cond
    [(and (<= 0 x)(> 10 x)) "white"]
    [(and (<= 10 x)(> 20 x)) "yellow"]
    [(and (<= 20 x)(> 30 x)) "orange"]
    [(and (<= 30 x)(> 40 x)) "green"]
    [(and (<= 40 x)(> 50 x)) "red"]
    [(<= 50 x 59) "blue"]
    [(> 0 x) "black"]))