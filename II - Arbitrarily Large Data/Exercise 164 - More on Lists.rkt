;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 164 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-money -> List-of-money
; Converts a list of US$ to a list of euro €
(check-expect (dtel '()) '())
(check-expect (dtel (cons 23 (cons 1528 '()))) (cons (dte 23) (cons (dte 1528) '())))

(define (dtel dl)
  (cond
    [(empty? dl) '()]
    [else (cons (dte (first dl)) (dtel (rest dl)))]))


; Number -> Number
; Converts from US$ to Euro€
(check-expect (dte 1) 0.877510118)

(define (dte d)
  (* d 0.877510118))


; A List-of-money is one of: 
; – '()
; – (cons Number List-of-money)
(define lom1 '())
(define lom2 (cons 23 (cons 1 '())))