;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 245 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Function Function -> Boolean
; Given two functions from numbers to numbers, the function determines
; whether the two produce the same results for 1.2, 3, and -5.775.
(check-expect (function=at-1.2-3-and-5.775? x y) #false)
(check-expect (function=at-1.2-3-and-5.775? x z) #false)

(define (function=at-1.2-3-and-5.775? f1 f2)
  (and (= (f1 1.2) (f2 1.2))
       (= (f1 3) (f2 3))
       (= (f1 -5.775) (f2 -5.775))))


; Number -> Number
(define (x n)
  (+ n 2))

; Number -> Number
(define (y n)
  (- n 3.5))

; Number -> Number
(define (z n)
  (* n (/ 5 3)))