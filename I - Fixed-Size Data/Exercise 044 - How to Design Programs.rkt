;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 44 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define tree (underlay/xy (circle 10 "solid" "green") 9 15 (rectangle 2 20 "solid" "brown")))
(define WHEEL-RADIUS 5.5)
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 4))
(define CAR-BODY (overlay/align "middle" "bottom" (rectangle (* 5 WHEEL-RADIUS) (* 4 WHEEL-RADIUS) "solid" "red")
                                (rectangle (* 11 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")))
(define SPACE (rectangle WHEEL-DISTANCE 0 "outline" "transparent"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR (above CAR-BODY BOTH-WHEELS))
(define WORLD-WIDTH 300)
(define WORLD-HEIGHT 180)
(define BACKGROUND (overlay tree (empty-scene WORLD-WIDTH WORLD-HEIGHT)))
(define (Y-CAR ws) (+ (* (sin (/ ws 57)) 100) 60))

;an AnimationState is a Number.
;interpretation the number of clock ticks 
;since the animation started

;worldstate -> worldstate
;moves the car by 3 pixels for every clock tick
(define (tock ws)(+ ws 3))
(check-expect (tock 3) 6)

;worldstate -> image
;places the car into the BACKGROUND scene
(define (render ws) (place-image CAR (- ws (/ (image-width CAR) 2)) (Y-CAR ws) BACKGROUND))
(check-expect (render 50)(place-image CAR (- 50 (/ (image-width CAR) 2)) (Y-CAR 50) BACKGROUND))

;worldstate -> boolean?
;stops the animation
(define (last-world ws) (>= ws 400))

;WorldState Number Number String -> WorldState
;places the car at x-mouse
;if the given me is "button-down"
;given: 21 10 20 "enter"
;wanted: 21
;given: 42 10 20 "button-down"
;wanted: 10
;given: 42 10 20 "move"
;wanted: 42
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

(define (main ws)
  (big-bang ws
  [to-draw render]
  [on-tick tock]
  [stop-when last-world]
  [on-mouse hyper]))

(main 1)