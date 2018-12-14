;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 252 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define LO-N1 (list 1 2 3 4 5 6))
(define LO-POSN1 (list (make-posn 20 30) (make-posn 40 70) (make-posn 50 50)))

; graphical constants:    
(define emt
  (empty-scene 100 100))
(define dot
  (circle 3 "solid" "red"))



; [List-of Item] Result [Item Item -> Result] -> Result
(check-expect (fold2 LO-N1 1 *) (product LO-N1))
(check-expect (fold2 LO-POSN1 emt place-dot) (image* LO-POSN1))

(define (fold2 l i g)
  (cond
    [(empty? l) i]
    [else
     (g (first l)
        (fold2 (rest l) i g))]))


; [List-of Number] -> Number
(check-expect (fold2-product LO-N1) (product LO-N1))

(define (fold2-product l)
  (fold2 l 1 *))

; [List-of Posn] -> Image
(check-expect (fold2-image* LO-POSN1) (image* LO-POSN1))

(define (fold2-image* l)
  (fold2 l emt place-dot))




; ________________________________________________________________________




; [List-of Number] -> Number
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product
          (rest l)))]))

; [List-of Posn] -> Image
(define (image* l)
  (cond
    [(empty? l) emt]
    [else
     (place-dot
      (first l)
      (image* (rest l)))]))



; Posn Image -> Image 
(define (place-dot p img)
  (place-image
     dot
     (posn-x p) (posn-y p)
     img))