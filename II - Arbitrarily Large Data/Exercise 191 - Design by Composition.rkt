;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 191 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define MT (empty-scene 100 100))
(define triangle-p (list (make-posn 20 0) (make-posn 10 10) (make-posn 30 10)))

; Image NELoP -> Image 
; connects the dots in p by rendering lines in img
(check-expect (connect-dots MT triangle-p)
              (scene+line
               (scene+line MT 20 0 10 10 "red")
               10 10 30 10 "red"))

(define (connect-dots img p)
  (cond
    [(empty? (rest p)) img]
    [else (render-line
           (connect-dots img (rest p))
           (first p)
           (second p))]))

; An NELoP is one of: 
; – (cons Posn '())
; – (cons Posn NELoP)


; Image Posn Posn -> Image
; draws a red line from Posn p to Posn q into img
(check-expect (render-line MT (make-posn 10 10) (make-posn 20 30))
              (scene+line MT 10 10 20 30 "red"))

(define (render-line img p q)
  (scene+line
   img
   (posn-x p) (posn-y p) (posn-x q) (posn-y q)
   "red"))