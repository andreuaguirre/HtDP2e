;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 142 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-images PositiveNumber -> ImageOrFalse
; Produces the first image on loi that is not an n by n square.
; If it cannot find such an image, it produces #false.
(check-expect (ill-sized? '() 5) #false)
(check-expect (ill-sized? (cons (square 8 "solid" "red") '()) 8) #false)
(check-expect (ill-sized? (cons (rectangle 2 5 "solid" "red") '()) 2) (rectangle 2 5 "solid" "red"))
(check-expect (ill-sized? (cons (square 4 "solid" "black") (cons (circle 1 "solid" "white") '())) 4) (circle 1 "solid" "white"))

(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [else (if (and (not (= (image-width (first loi)) (image-height (first loi)) n)) (not (empty? loi)))
              (first loi)
              (ill-sized? (rest loi) n))]))


; A List-of-images is one of: 
; – '()
; – (cons Image List-of-images)
(define list-of-images1 '())
(define list-of-images2 (cons (rectangle 5 2 "solid" "white") '()))

; ImageOrFalse is one of:
; - Image
; - False
(define imageorfalse1 (circle 2 "solid" "red"))
(define imageorfalse2 #false)

