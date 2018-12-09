;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 192 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Polygon is one of: 
; – (cons Posn (cons Posn (cons Posn '()))) 
; – (cons Posn Polygon)
(define poly1 (cons (make-posn 1 4) (cons (make-posn 6 10) (cons (make-posn 10 30) '()))))
(define poly2 (cons (make-posn 7 11) poly1))


;; Exercise 192. Argue why it is acceptable to use last on Polygons.
;; Also argue why you may adapt the template for connect-dots to last:


; - It's acceptable to use last on Polygons becuase you want to connect
; the last posn of Polygons with the first one.

; - You may want to adapt this template because you want a template
; for a non empty list that recurrs.



; NELoP -> Posn
; extracts the last item from a NELop
(check-expect (last* (list (make-posn 2 3))) (make-posn 2 3))
(check-expect (last* (list (make-posn 1 3) (make-posn 4 3) (make-posn 7 0))) (make-posn 7 0))
(check-expect (last* poly1) (make-posn 10 30))
(check-expect (last* poly2) (make-posn 10 30))

(define (last* p)
  (cond
    [(empty? (rest p)) (first p)]
    [else (last* (rest p))]))


; Polygon -> Posn
; extracts the last item from p
(check-expect (last poly1) (make-posn 10 30))
(check-expect (last poly2) (make-posn 10 30))

(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))


;; As expected, it's easier with the generalized last* function.