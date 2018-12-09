;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 169 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-posn -> List-of-posn
; Consumes and produces a list of Posns.
; The result contains all those Posns whose x-coordinates are between 0 and 100
; and whose y-coordinates are between 0 and 200.
(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn 3 300) (cons (make-posn 40 80) (cons (make-posn 130 50) '())))) (cons (make-posn 40 80) '()))

(define (legal lop)
  (cond
    [(empty? lop) '()]
    [(posl? (first lop)) (cons (first lop) (legal (rest lop)))]
    [else (legal (rest lop))]))

; Posn -> Boolean
(check-expect (posl? (make-posn 50 50)) #true)
(check-expect (posl? (make-posn 120 40)) #false)
(check-expect (posl? (make-posn 20 250)) #false)

(define (posl? p)
  (and (>= 100 (posn-x p) 0)
       (>= 200 (posn-y p) 0)))



; A List-of-posn is one of:
; - '()
; - (cons Posn list-of-posn)
(define lop1 '())
(define lop2 (cons (make-posn 2 1) '()))