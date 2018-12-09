;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 159 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; N -> Pair
; Runs the riot program
(define (riot x)
  (big-bang (pairgen (add1 x))
    [to-draw render]
    [on-tick tock 1]))


; N -> Pair
; Consumes a N to generate a Pair of N-ballon# and N posn's
(check-expect (pairgen 0) (make-pair 0 '()))
(check-random (pairgen 1) (make-pair 1 (lopgen 1)))
(check-random (pairgen 6) (make-pair 6 (lopgen 6)))

(define (pairgen n)
  (make-pair n (lopgen n)))


; N -> List-of-posn
; Consumes a N to make a List-of-Posn of N Posn
(check-expect (lopgen 0)  '())
(check-random (lopgen 1) (cons (make-posn (random W-WIDTH) (random W-HEIGHT)) '()))
(check-random (lopgen 2) (cons (make-posn (random W-WIDTH) (random W-HEIGHT)) (cons (make-posn (random W-WIDTH) (random W-HEIGHT)) '())))

(define (lopgen n)
  (cond
    [(equal? n 0) '()]
    [else (cons (make-posn (random W-WIDTH) (random W-HEIGHT)) (lopgen (sub1 n)))]))


; Pair -> Image
; Produces an image of the lecture hall with a red dot at the first posn of the pair
(check-expect (render (make-pair 0 '())) LECTURE-HALL)
(check-expect (render (make-pair 1 (cons (make-posn 40 20) '()))) (place-image BALLOON 40 20 LECTURE-HALL))
(check-expect (render (make-pair 2 (cons (make-posn 10 30) (cons (make-posn 40 20) '())))) (place-image BALLOON 10 30 LECTURE-HALL))

(define (render pr)
  (if
   (empty? (pair-lop pr))
   LECTURE-HALL
   (place-image BALLOON (posn-x (first (pair-lop pr))) (posn-y (first (pair-lop pr))) LECTURE-HALL)))


; Pair -> Pair
; Consumes one balloon and the first posn of a list-of-posn
(check-expect (tock (make-pair 0 '())) (make-pair 0 '()))
(check-expect (tock (make-pair 1 (cons (make-posn 2 3) '()))) (make-pair 0 '()))
(check-expect (tock (make-pair 3 (cons (make-posn 4 20) (cons (make-posn 5 2) (cons (make-posn 1 2) '()))))) (make-pair 2 (cons (make-posn 5 2) (cons (make-posn 1 2) '()))))

(define (tock pr)
  (cond
    [(empty? (pair-lop pr)) pr]
    [else (make-pair (sub1 (pair-balloon# pr)) (rest (pair-lop pr)))]))



; A Pair is a structure (make-pair N List-of-posn)
(define-struct pair [balloon# lop])
; interpretation (make-pair n lop) means n balloons 
; must yet be thrown and added to lop
(define PAIRex1 (make-pair 1 (cons (make-posn 2 4) '())))


; A list-of-posn is one of: 
; – '()
; – (cons Posn list-of-posn)
(define lop1 '())
(define lop2 (cons (make-posn 10 20) '()))



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