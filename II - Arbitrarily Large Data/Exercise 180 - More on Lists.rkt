;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 180 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))



; Lo1s -> Image
; renders a list of 1Strings as a text image
(check-expect (editor-text '()) (text "" FONT-SIZE FONT-COLOR))
(check-expect (editor-text (cons "p" (cons "o" (cons "s" (cons "t" '()))))) (text "post" FONT-SIZE FONT-COLOR))

(define (editor-text s)
  (text (cts s) FONT-SIZE FONT-COLOR))

; Lo1s -> String
; Consumes a lo1s to generate the append of all the
; 1Strings into a one and only String
(check-expect (cts '()) "")
(check-expect (cts (cons "p" (cons "o" (cons "s" (cons "t" '()))))) "post")

(define (cts s)
  (cond
    [(empty? cts) ""]
    [else (string-append (first cts) (editor-text (rest cts)))]))