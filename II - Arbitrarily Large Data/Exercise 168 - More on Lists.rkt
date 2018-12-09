;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 168 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-posn -> List-of-posn
; Adds1 to the posn-y of every posn of the list
(check-expect (translate '()) '())
(check-expect (translate (cons (make-posn 3 2) (cons (make-posn 8 1) '()))) (cons (make-posn 3 3) (cons (make-posn 8 2) '())))

(define (translate lop)
  (cond
    [(empty? lop) '()]
    [else (cons (make-posn (posn-x (first lop)) (add1 (posn-y (first lop)))) (translate (rest lop)))]))


; A List-of-posn is one of:
; - '()
; - (cons Posn list-of-posn)
(define lop1 '())
(define lop2 (cons (make-posn 2 1) '()))