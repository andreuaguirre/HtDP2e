;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 99 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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


; A SIGS is one of: 
; – (make-aim UFO Tank) struct
; – (make-fired UFO Tank Missile) struct
; interpretation represents the complete state of a 
; space invader game
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])


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


; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place
(define MISSILEexample1 (make-posn 10 20))
;template
(define (MISSILE-fn x)
  (... (... (posn-x x))
       (... (posn-y x))))



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

; MISSILE RENDER
; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render (make-posn 30 50) BACKGROUND) (place-image MISSILE 30 50 BACKGROUND))

(define (missile-render m im)
  (place-image MISSILE (posn-x m) (posn-y m) im))


; SIGS RENDER
; Sigs -> Image
; (si-render (make-aim UFO TANK))
; (si-render (make-fired UFO TANK MISSILE))
(check-expect (si-render (make-aim (make-posn 100 50) (make-tank 90 3))) (tank-render (make-tank 90 3) (ufo-render (make-posn 100 50) BACKGROUND)))
(check-expect (si-render (make-fired (make-posn 100 50) (make-tank 90 3) (make-posn 90 150))) (tank-render (make-tank 90 3) (ufo-render (make-posn 100 50) (missile-render (make-posn 90 150) BACKGROUND))))

(define (si-render s)
  (cond
    [(aim? s) (tank-render (aim-tank s) (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s) (tank-render (fired-tank s) (ufo-render (fired-ufo s) (missile-render (fired-missile s) BACKGROUND)))]))



;; STOP WHEN

; Sigs -> Boolean
; SI-GAME-OVER
; The game stops if the UFO lands or if the missile hits the UFO
; a final scene appears at the end of the game
(check-expect (si-game-over? (make-aim (make-posn 20 90) (make-tank 50 2))) #false)
(check-expect (si-game-over? (make-aim (make-posn 100 250) (make-tank 180 1))) si-render-final) ;UFO landed
(check-expect (si-game-over? (make-fired (make-posn 20 90) (make-tank 50 2) (make-posn 50 70))) #false)
(check-expect (si-game-over? (make-fired (make-posn 80 245) (make-tank 10 3) (make-posn 180 35))) si-render-final) ;UFO landed 
(check-expect (si-game-over? (make-fired (make-posn 80 50) (make-tank 10 3) (make-posn 82 51))) si-render-final) ;UFO destroyed

(define (si-game-over? s)
  (cond
    [(and (aim? s) (ufo-land? (aim-ufo s))) si-render-final]
    [(and (fired? s) (ufo-land? (fired-ufo s))) si-render-final]
    [(and (fired? s) (ufo-hit? (fired-ufo s) (fired-missile s))) si-render-final]
    [else #false]))


; UFO LAND?
; UFO -> Boolean
; If the UFO lands, #true
; Else #false
(check-expect (ufo-land? (make-posn 50 100)) #false)
(check-expect (ufo-land? (make-posn 20 230)) #true)

(define (ufo-land? u)
  (>= (posn-y u)
      (- WORLD-HEIGHT (/ (image-height UFO) 2))))
  

; UFO HIT?
; UFO Missile -> Boolean
; If the UFO get hit by the missile, #true
; Else #false
(check-expect (ufo-hit? (make-posn 50 40) (make-posn 50 120)) #false)
(check-expect (ufo-hit? (make-posn 95 80) (make-posn 100 85)) #true)

(define (ufo-hit? u m)
  (and (<= (abs (- (posn-x u) (posn-x m)))
           (+ (/ (image-width UFO) 2) (/ (image-width MISSILE) 2)))
       (<= (abs (- (posn-y u) (posn-y m)))
           (+ (/ (image-height UFO) 2) (/ (image-height MISSILE) 2)))))


; Si-game-over -> Image
; When the game stops, renders a final image
(define GAME-OVER (place-image (text "GAME OVER" 30 "black") (/ WORLD-WIDTH 2) (/ WORLD-HEIGHT 2) BACKGROUND))

(define si-render-final
  GAME-OVER)



;; ON TICK

; SIGS -> SIGS
; moves the space-invader objects predictably
(check-random (si-move (make-aim (make-posn 10 20) (make-tank 100 150))) (si-move-proper (make-aim (make-posn 10 20) (make-tank 100 150)) (random 2)))
(check-random (si-move (make-fired (make-posn 10 20) (make-tank 100 150) (make-posn 10 3))) (si-move-proper (make-fired (make-posn 10 20) (make-tank 100 150) (make-posn 10 3)) (random 2)))

(define (si-move w)
  (si-move-proper w (random 2)))

; SIGS Number -> SIGS 
(check-random (si-move-proper (make-aim (make-posn 20 30) (make-tank 50 2)) 0) (make-aim (refresh-ufo (make-posn 20 30) 0) (refresh-tank (make-tank 50 2))))
(check-random (si-move-proper (make-aim (make-posn 20 30) (make-tank 50 2)) 1) (make-aim (refresh-ufo (make-posn 20 30) 1) (refresh-tank (make-tank 50 2))))
(check-random (si-move-proper (make-fired (make-posn 100 200) (make-tank 123 3) (make-posn 70 12)) 0) (make-fired (refresh-ufo (make-posn 100 200) 0) (refresh-tank (make-tank 123 3)) (refresh-missile (make-posn 70 12))))
(check-random (si-move-proper (make-fired (make-posn 100 200) (make-tank 123 3) (make-posn 70 12)) 1) (make-fired (refresh-ufo (make-posn 100 200) 1) (refresh-tank (make-tank 123 3)) (refresh-missile (make-posn 70 12))))


(define (si-move-proper si r)
  (cond
    [(aim? si) (make-aim (refresh-ufo (aim-ufo si) r) (refresh-tank (aim-tank si)))]
    [(fired? si) (make-fired (refresh-ufo (fired-ufo si) r) (refresh-tank (fired-tank si)) (refresh-missile (fired-missile si)))]))


; refresh missile
; Missile -> Missile
(check-expect (refresh-missile (make-posn 20 150)) (make-posn 20 (- 150 SPEED-MISSILE)))

(define (refresh-missile m)
  (make-posn (posn-x m) (- (posn-y m) SPEED-MISSILE)))

; refresh tank
; Tank -> Tank
(check-expect (refresh-tank (make-tank 20 3)) (make-tank 23 3))

(define (refresh-tank t)
  (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t)))

; refresh ufo
; Ufo Number -> Ufo
(check-random (refresh-ufo (make-posn 50 20) 0) (make-posn (- 50 JUMP) (+ 20 SPEED-UFO)))
(check-random (refresh-ufo (make-posn 30 10) 1) (make-posn (+ 30 JUMP) (+ 10 SPEED-UFO)))

(define (refresh-ufo u r)
  (cond 
    [(= r 0) (make-posn (- (posn-x u) JUMP) (+ (posn-y u) SPEED-UFO))]
    [(= r 1) (make-posn (+ (posn-x u) JUMP) (+ (posn-y u) SPEED-UFO))]))
