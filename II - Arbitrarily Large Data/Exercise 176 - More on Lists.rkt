;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 176 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Row is one of:
;  – '()
;  – (cons Number Row)
(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))
(define wor1 (cons 11 (cons 21 '())))
(define wor2 (cons 12 (cons 22 '())))

; A Matrix is one of:
;  – (cons Row '())
;  – (cons Row Matrix)
; constraint all rows in matrix are of the same length
(define mat1 (cons row1 (cons row2 '())))
(define tam1 (cons wor1 (cons wor2 '())))

; Matrix -> Matrix
; transposes the given matrix along the diagonal 
(check-expect (transpose mat1) tam1)
 
(define (transpose lln)
  (cond
    [(empty? (first lln)) '()]
    [else (cons (first* lln) (transpose (rest* lln)))]))


; Matrix -> Row
; Consumes a matrix and produces the first column as a list of numbers
(check-expect (first* '()) '())
(check-expect (first* mat1) wor1)

(define (first* mat)
  (cond
    [(empty? mat) '()]
    [else (cons (first (first mat)) (first* (rest mat)))]))

; Matrix -> Matrix
; Consumes a matrix and removes the first column.
(check-expect (rest* '()) '())
(check-expect (rest* mat1) (cons (cons 12 '()) (cons (cons 22 '()) '())))

(define (rest* mat)
  (cond
    [(empty? mat) '()]
    [else (cons (rest (first mat)) (rest* (rest mat)))]))