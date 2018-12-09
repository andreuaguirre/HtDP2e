;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 109 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Rect is a struct
; (make-rect (color))
; -Color is a string
; interp: color of the rectangle
(define-struct rect [color])

(define RECTex1 (make-rect "black")) ;for a black rectangle


; Rect -> Image
; Renders the rectangle of the desired color
(check-expect (render (make-rect "green")) (rectangle 100 100 "solid" "green"))
(check-expect (render (make-rect "white")) (rectangle 100 100 "solid" "white"))
(check-expect (render (make-rect 2)) (text "ERROR" 20 "red"))

(define (render r)
  (if
   (string? (rect-color r))
   (rectangle 100 100 "solid" (rect-color r))
   (text "ERROR" 20 "red")))

; Rect KeyEvent -> Rect
; Starts the sequence:
; – "start, expect an 'a'"
; – "expect 'b', 'c', or 'd'"
; – "finished" 
; – "error, illegal key"
; Space key to restart the sequance
(check-expect (keyh (make-rect "white") "a") (make-rect "yellow"))
(check-expect (keyh (make-rect "white") "b") (make-rect "red"))
(check-expect (keyh (make-rect "white") "z") (make-rect "red"))
(check-expect (keyh (make-rect "yellow") "b") (make-rect "yellow"))
(check-expect (keyh (make-rect "yellow") "c") (make-rect "yellow"))
(check-expect (keyh (make-rect "yellow") "d") (make-rect "green"))
(check-expect (keyh (make-rect "yellow") "a") (make-rect "red"))
(check-expect (keyh (make-rect "yellow") "z") (make-rect "red"))
(check-expect (keyh (make-rect "red") " ") (make-rect "white"))
(check-expect (keyh (make-rect "green") " ") (make-rect "white"))
(check-expect (keyh (make-rect "blue") "q") (make-rect "blue"))

(define (keyh r ke)
  (cond
    [(and (string=? (rect-color r) "white") (equal? ke "a")) (make-rect "yellow")]
    [(and (string=? (rect-color r) "white") (not (equal? ke "a"))) (make-rect "red")]
    [(and (string=? (rect-color r) "yellow") (or (equal? ke "b") (equal? ke "c"))) (make-rect "yellow")]
    [(and (string=? (rect-color r) "yellow") (equal? ke "d")) (make-rect "green")]
    [(and (string=? (rect-color r) "yellow") (not (or (equal? ke "b") (equal? ke "c") (equal? ke "d")))) (make-rect "red")]
    [(and (or (string=? (rect-color r) "green") (string=? (rect-color r) "red")) (equal? ke " ")) (make-rect "white")]
    [else r]))



(define (main r)
  (big-bang r
    [to-draw render]
    [on-key keyh]))


(main (make-rect "white"))