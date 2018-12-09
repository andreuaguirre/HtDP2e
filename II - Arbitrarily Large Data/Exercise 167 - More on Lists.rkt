;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 167 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-posn -> Number
; Consumes a list of Posns and produces the sum of all of its x-coordinates.
(check-expect (sum '()) 0)
(check-expect (sum (cons (make-posn 3 2) (cons (make-posn 1 9) '()))) (+ 3 2 1 9))

(define (sum lop)
  (cond
    [(empty? lop) 0]
    [else (+ (posn-x (first lop)) (posn-y (first lop)) (sum (rest lop)))]))


; A List-of-posn is one of:
; - '()
; - (cons Posn list-of-posn)
(define lop1 '())
(define lop2 (cons (make-posn 2 1) '()))