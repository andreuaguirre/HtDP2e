;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 101 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Graphical constants
(define TANK (rectangle 15 10 "solid" "black"))
(define UFO (circle 7 "solid" "red"))
(define MISSILE (triangle 6 "solid" "black"))

; Physical constants
(define WORLD-WIDTH 200)
(define WORLD-HEIGHT 200)
(define BACKGROUND (empty-scene WORLD-WIDTH WORLD-HEIGHT))
(define Y-TANK (- WORLD-HEIGHT (image-height TANK)))
(define SPEED-UFO 2)
(define SPEED-MISSILE 5)
(define JUMP 10)



; A SIGS.v2 (short for SIGS version 2) is a structure:
; (make-sigs UFO Tank MissileOrNot)
; interpretation represents the complete state of a
; space invader game
(define-struct sigs [ufo tank missile])


; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
(define UFOexample1 (make-posn 40 30))
;template
(define (UFO-fn x)
  (... (... (posn-x x))
       (... (posn-y x))))


; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick
(define-struct tank [loc vel])

(define TANKexample1 (make-tank 20 3))
;template
(define (TANK-fn x)
  (... (... (tank-loc x))
       (... (tank-vel x))))


; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location
(define missileexample (make-posn 40 100))
(define missilenotexameple #false)
;template
(define (missileornot-fn mn)
  (cond
    [(boolean? mn) ...]
    [(posn? mn) ...]))


;; RENDER

; TANK RENDER
; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render (make-tank 20 2) BACKGROUND) (place-image TANK 20 Y-TANK BACKGROUND))

(define (tank-render t im)
  (place-image TANK (tank-loc t) Y-TANK im))

; UFO RENDER
; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render (make-posn 20 30) BACKGROUND) (place-image UFO 20 30 BACKGROUND))

(define (ufo-render u im)
  (place-image UFO (posn-x u) (posn-y u) im))

; MissileOrNot Image -> Image 
; adds an image of missile m to scene s
(check-expect (missile-render.v2 #false BACKGROUND) BACKGROUND)
(check-expect (missile-render.v2 (make-posn 32 (- WORLD-HEIGHT (image-height TANK) 10)) BACKGROUND) (place-image MISSILE 32 (- WORLD-HEIGHT (image-height TANK) 10) BACKGROUND))

(define (missile-render.v2 m s)
  (cond
    [(boolean? m) s]
    [(posn? m) (place-image MISSILE (posn-x m) (posn-y m) s)]))


; SIGS.v2 -> Image 
; renders the given game state on top of BACKGROUND 
(define (si-render.v2 s)
  (tank-render
   (sigs-tank s)
   (ufo-render (sigs-ufo s)
               (missile-render.v2 (sigs-missile s)
                                  BACKGROUND))))