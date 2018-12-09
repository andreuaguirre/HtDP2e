;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 96 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define WORLD-WIDTH 200)
(define WORLD-HEIGHT 200)
(define BACKGROUND (empty-scene WORLD-WIDTH WORLD-HEIGHT))

; graphical constants
(define TANK (rectangle 15 10 "solid" "black"))
(define UFO (circle 7 "solid" "red"))
(define MISSILE (triangle 6 "solid" "black"))


; aim and fired are both structures
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])


; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)


; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick
(define-struct tank [loc vel])


; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place


; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game



; Exercise 96. Sketch how each of the three game states
; could be rendered assuming a image canvas. 

; Here is an instance that describes the tank maneuvering into position to fire the missile:
(make-aim (make-posn 20 10) (make-tank 28 -3))
(define sketch1 (place-image UFO 20 10
                             (place-image TANK 28 (- WORLD-HEIGHT (image-height TANK))
                                          BACKGROUND)))

; This one is just like the previous one but the missile has been fired:
(make-fired (make-posn 20 10)
            (make-tank 28 -3)
            (make-posn 28 (- WORLD-HEIGHT (image-height TANK))))

(define sketch2 (place-image UFO 20 10
                             (place-image TANK 28 (- WORLD-HEIGHT (image-height TANK))
                                          (place-image MISSILE 28 (- (- WORLD-HEIGHT (image-height TANK)) 10)
                                                       BACKGROUND))))
  
; Finally, here is one where the missile is about to collide with the UFO:
(make-fired (make-posn 20 100)
            (make-tank 100 3)
            (make-posn 22 103))

(define sketch3 (place-image MISSILE 20 103
               (place-image TANK 100 (- WORLD-HEIGHT (image-height TANK))
                            (place-image UFO 22 100
                                         BACKGROUND))))
