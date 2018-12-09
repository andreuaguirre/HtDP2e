;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 193 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define MT (empty-scene 100 100))

; A Polygon is one of: 
; – (cons Posn (cons Posn (cons Posn '()))) 
; – (cons Posn Polygon)
(define poly1 (cons (make-posn 20 40) (cons (make-posn 40 40) (cons (make-posn 20 60) '()))))
(define poly2 (cons (make-posn 7 11) poly1))

; Image Polygon -> Image 
; adds an image of p to MT
; Version 1
(define (render-polygon1 img p)
  (connect-dots img (lastp poly1)))

; Image Polygon -> Image 
; adds an image of p to MT
; Version 2
(define (render-polygon2 img p)
  (connect-dots img (add-at-end (first p) p)))

; Posn Polygon -> Polygon
; Add the first item of p to the end of p
(check-expect (add-at-end (first poly1) poly1) (cons (make-posn 20 40) (cons (make-posn 40 40) (cons (make-posn 20 60) (cons (make-posn 20 40) '())))))

(define (add-at-end pos p)
  (cond
    [(empty? (rest p)) (cons (first p) (cons  pos '()))]
    [else (cons (first p) (add-at-end pos (rest p)))]))

; NELoP -> NELoP
; Extracts the last item of p and cons it to p
(check-expect (lastp poly1) (cons (last* poly1) poly1))

(define (lastp p)
  (cons (last* p) p))

; NELoP -> Posn
; extracts the last item from a NELop
(check-expect (last* (list (make-posn 2 3))) (make-posn 2 3))
(check-expect (last* (list (make-posn 1 3) (make-posn 4 3) (make-posn 7 0))) (make-posn 7 0))
(check-expect (last* poly1) (make-posn 20 60))
(check-expect (last* poly2) (make-posn 20 60))

(define (last* p)
  (cond
    [(empty? (rest p)) (first p)]
    [else (last* (rest p))]))

; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots img p)
  (cond
    [(empty? (rest p)) MT]
    [else (render-line (connect-dots img (rest p))
                       (first p)
                       (second p))]))

; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (scene+line
    im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))