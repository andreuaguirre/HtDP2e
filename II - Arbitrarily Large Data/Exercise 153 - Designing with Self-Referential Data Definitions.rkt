;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 153 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-posn -> Image
; Produces an image of the lecture hall with red dots added as specified by the Posns.
(check-expect (add-balloons '()) LECTURE-HALL)
(check-expect (add-balloons (cons (make-posn 10 20) '())) (place-image BALLOON 10 20 LECTURE-HALL))
(check-expect (add-balloons (cons (make-posn 40 100) (cons (make-posn 10 20) '()))) (place-image BALLOON 40 100 (place-image BALLOON 10 20 LECTURE-HALL)))

(define (add-balloons lp)
  (cond
    [(empty? lp) LECTURE-HALL]
    [else (place-image BALLOON (posn-x (first lp)) (posn-y (first lp)) (add-balloons (rest lp)))]))


; A list-posn is one of: 
; – '()
; – (cons Posn list-posn)
(define lp1 '())
(define lp2 (cons (make-posn 10 20) '()))



;; LECTURE HALL


; N Image -> Image
; Consumes a natural number n and an image img.
; It produces a column of n copies of img.
(check-expect (col 0 (circle 8 "solid" "red")) empty-image)
(check-expect (col 1 (circle 8 "solid" "red")) (circle 8 "solid" "red"))
(check-expect (col 2 (circle 8 "solid" "red")) (above (circle 8 "solid" "red") (circle 8 "solid" "red")))

(define (col n img)
  (cond
    [(equal? n 0) empty-image]
    [else (above img (col (sub1 n) img))]))

; N Image -> Image
; Consumes a natural number n and an image img.
; It produces a row of n copies of img.
(check-expect (row 0 (circle 6 "solid" "red")) empty-image)
(check-expect (row 1 (circle 6 "solid" "red")) (circle 6 "solid" "red"))
(check-expect (row 2 (circle 6 "solid" "red")) (beside (circle 6 "solid" "red") (circle 6 "solid" "red")))

(define (row n img)
  (cond
    [(equal? n 0) empty-image]
    [else (beside img (row (sub1 n) img))]))

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers
(define N1 0)
(define N2 5)



; Physical constants
(define W-WIDTH 80)
(define H-W-WIDTH (/ W-WIDTH 2))
(define W-HEIGHT 180)
(define H-W-HEIGHT (/ W-HEIGHT 2))
(define EMSC (empty-scene W-WIDTH W-HEIGHT))
(define SQUARE-SIZE 10)
(define N-ROW 18)
(define N-COL 8)
(define BALLON-RAD 4)

; Graphical constants
(define BALLOON (circle BALLON-RAD "solid" "red"))
(define SQUARE (square SQUARE-SIZE "outline" "black"))
(define LECTURE-HALL (place-image (col N-ROW (row N-COL SQUARE)) H-W-WIDTH H-W-HEIGHT EMSC))