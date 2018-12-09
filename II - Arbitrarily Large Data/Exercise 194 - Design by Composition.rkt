;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 194 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define MT (empty-scene 100 100))

; A Polygon is one of: 
; – (cons Posn (cons Posn (cons Posn '()))) 
; – (cons Posn Polygon)
(define poly1 (cons (make-posn 20 40) (cons (make-posn 40 40) (cons (make-posn 20 60) '()))))
(define poly2 (cons (make-posn 7 11) poly1))


; Image Polygon -> Image 
; adds an image of p to MT
(define (render-polygon img p)
  (connect-dots img p (first p)))
 
; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots img p p2)
  (cond
    [(empty? (rest p)) (render-line img (first p) p2)]
    [else (render-line (connect-dots img (rest p) p2)
                       (first p)
                       (second p))]))
 
; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (scene+line
    im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))
 
; Polygon -> Posn
; extracts the last item from p
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))