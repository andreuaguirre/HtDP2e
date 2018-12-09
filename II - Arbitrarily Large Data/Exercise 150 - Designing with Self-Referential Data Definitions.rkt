;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 150 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; N -> Number
; Computes (+ n pi) without using +
(check-within (add-to-pi 0) pi 0.001)
(check-within (add-to-pi 3) (+ 3 pi) 0.001)
(check-within (add-to-pi 5) (+ 5 pi) 0.001)

(define (add-to-pi n)
  (cond
    [(equal? n 0) pi]
    [else (add1 (add-to-pi (sub1 n)))]))


; N Number -> Number
; Computes (+ n x) without using +
(check-expect (add 0 5) 5)
(check-expect (add 2 4) 6)
(check-expect (add 10 2) 12)

(define (add n x)
  (cond
    [(equal? n 0) x]
    [else (add1 (add (sub1 n) x))]))


; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers
(define N1 0)
(define N2 5)