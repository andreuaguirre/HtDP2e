;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 158 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define HEIGHT 220) ; distances in terms of pixels
(define WIDTH 30)
(define XSHOTS (- (/ WIDTH 2) 8))
 
; graphical constants
(define BACKGROUND (rectangle WIDTH HEIGHT "solid" "green"))
(define SHOT (rectangle 6 10 "solid" "black"))


; ShotWorld -> ShotWorld
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))
 
; ShotWorld -> ShotWorld
; moves each shot up by one pixel
(check-expect (tock '()) '())
(check-expect (tock (cons 4 (cons 14 '()))) (cons 3 (cons 13 '())))
(check-expect (tock (cons 25 (cons 18 (cons -12 (cons 1 (cons 4 '())))))) (cons 24 (cons 17 (cons 0 (cons 3 '())))))

(define (tock w)
  (cond
    [(empty? w) '()]
    [(> (first w) 0) (cons (sub1 (first w)) (tock (rest w)))]
    [else (tock (rest w))]))
 
; ShotWorld KeyEvent -> ShotWorld
; adds a shot to the world if the space bar is hit
(check-expect (keyh '() " ") (cons HEIGHT '()))
(check-expect (keyh (cons 6 (cons 9 (cons 14 '()))) " ") (cons HEIGHT (cons 6 (cons 9 (cons 14 '())))))
(check-expect (keyh (cons 12 '()) "e") (cons 12 '()))

(define (keyh w ke)
  (if (key=? ke " ") (cons HEIGHT w) w))
 
; ShotWorld -> Image
; adds each shot y on w at (XSHOTS,y} to BACKGROUND
(check-expect (to-image '()) BACKGROUND)
(check-expect (to-image (cons 5 (cons 1 '()))) (place-image SHOT XSHOTS 5 (place-image SHOT XSHOTS 1 BACKGROUND)))

(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else (place-image SHOT XSHOTS (first w)
                       (to-image (rest w)))]))




; A ShotWorld is List-of-numbers.
; interpretation each number on such a list
;   represents the y-coordinate of a shot


; A List-of-numbers is one of:
; – '()
; – (cons Number List-of-numbers)
(define LON1 '())
(define LON2 (cons 2 (cons 6 '())))