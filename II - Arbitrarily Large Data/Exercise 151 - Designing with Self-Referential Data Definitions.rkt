;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 151 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; N Number -> Number
; Computes (* n x) without using *
(check-expect (multiply 0 5) 0)
(check-expect (multiply 2 4) 8)
(check-expect (multiply 5 1) 5)
(check-expect (multiply 4 0) 0)
(check-expect (multiply 1 3) 3)

(define (multiply n x)
  (cond
    [(equal? x 0) 0]
    [else (+ n (multiply n (sub1 x)))]))


; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers
(define N1 0)
(define N2 5)


; Use DrRacket’s stepper to evaluate (multiply 3 x) for any x you like.
; How does multiply relate to what you know from grade school?
(multiply 3 4)

;; It works this way: (+ 3 (+ 3 (+ 3 3)))