;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 102 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Graphical constants
(define TANK (rectangle 15 10 "solid" "black"))
(define UFO (circle 7 "solid" "red"))
(define MISSILE (triangle 6 "solid" "black"))

; Physical constants
(define WORLD-WIDTH 200)
(define HWORLD-WIDTH (/ WORLD-WIDTH 2))
(define WORLD-HEIGHT 200)
(define HWORLD-HEIGHT (/ WORLD-HEIGHT 2))
(define BACKGROUND (empty-scene WORLD-WIDTH WORLD-HEIGHT))
(define Y-TANK (- WORLD-HEIGHT (image-height TANK)))
(define SPEED-UFO 1)
(define SPEED-MISSILE 9)
(define JUMP 10)
(define HALF-Y-UFO (/ (image-height UFO) 2))
(define HALF-X-UFO (/ (image-width UFO) 2))
(define HALF-Y-MISSILE (/ (image-height MISSILE) 2))
(define HALF-X-MISSILE (/ (image-width MISSILE) 2))
(define HALF-Y-TANK (/ (image-height TANK) 2))
(define HALF-X-TANK (/ (image-width TANK) 2))


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
(check-expect (si-render.v2 (make-sigs (make-posn 90 30) (make-tank 20 4) #false)) (tank-render (make-tank 20 4) (ufo-render (make-posn 90 30) (missile-render.v2 #false BACKGROUND))))
(check-expect (si-render.v2 (make-sigs (make-posn 140 60) (make-tank 138 2) (make-posn 138 170))) (tank-render (make-tank 138 2) (ufo-render (make-posn 140 60) (missile-render.v2 (make-posn 138 170) BACKGROUND))))

(define (si-render.v2 s)
  (tank-render (sigs-tank s)
               (ufo-render (sigs-ufo s)
                           (missile-render.v2 (sigs-missile s)
                                              BACKGROUND))))



;; STOP WHEN

; Sigs -> Boolean
; SI-GAME-OVER
; The game stops if the UFO lands or if the missile hits the UFO
; a final scene appears at the end of the game
(check-expect (si-game-over? (make-sigs (make-posn 20 30) (make-tank 90 2) (make-posn 90 30))) #false)
(check-expect (si-game-over? (make-sigs (make-posn 20 30) (make-tank 90 2) #false)) #false)
(check-expect (si-game-over? (make-sigs (make-posn 10 230) (make-tank 60 1) (make-posn 60 150))) #true)
(check-expect (si-game-over? (make-sigs (make-posn 10 230) (make-tank 60 1) #false)) #true)
(check-expect (si-game-over? (make-sigs (make-posn 100 70) (make-tank 10 3) (make-posn 105 72))) #true)

(define (si-game-over? s)
  (or
   (ufo-land? (sigs-ufo s))
   (ufo-hit? (sigs-ufo s)
             (sigs-missile s))))

; UFO LAND?
; UFO -> Boolean
; If the UFO lands, #true
; Else #false
(check-expect (ufo-land? (make-posn 50 100)) #false)
(check-expect (ufo-land? (make-posn 20 230)) #true)  ;land

(define (ufo-land? u)
  (>= (posn-y u)
      (- WORLD-HEIGHT HALF-Y-UFO)))
  
; UFO HIT?
; UFO Missile -> Boolean
; If the UFO get hit by the missile, #true
; Else #false
(check-expect (ufo-hit? (make-posn 50 40) (make-posn 50 120)) #false)
(check-expect (ufo-hit? (make-posn 95 80) (make-posn 100 85)) #true)  ;hit
(check-expect (ufo-hit? (make-posn 10 100) #false) #false)

(define (ufo-hit? u m)
  (cond
    [(posn? m) (and (<= (abs (- (posn-x u) (posn-x m)))
                        (+ HALF-X-UFO HALF-X-MISSILE))
                    (<= (abs (- (posn-y u) (posn-y m)))
                        (+ HALF-Y-UFO HALF-Y-MISSILE)))]
    [(boolean? m) #false]))

; Si-game-over -> Image
; When the game stops, renders a final image
(define GAME-OVER (place-image (text "GAME OVER" 30 "black") HWORLD-WIDTH HWORLD-HEIGHT BACKGROUND))

(define si-render-final
  GAME-OVER)



;; ON TICK

; SIGS -> SIGS
; moves the space-invader objects Missile and Tank predictably
; UFO jumps on a random direction
(check-random (si-move (make-sigs (make-posn 100 50) (make-tank 24 4) #false)) (si-move-proper (make-sigs (make-posn 100 50) (make-tank 24 4) #false) (random 3)))

(define (si-move si)
  (si-move-proper si (random 3)))

; SIGS Number -> SIGS
; moves the space-invader objects predictably, with Number r [0 3]
(check-expect (si-move-proper (make-sigs (make-posn 40 20) (make-tank 10 3) #false) 0) (make-sigs (refresh-ufo (make-posn 40 20) 0) (refresh-tank (make-tank 10 3)) #false))
(check-expect (si-move-proper (make-sigs (make-posn 40 20) (make-tank 10 3) #false) 1) (make-sigs (refresh-ufo (make-posn 40 20) 1) (refresh-tank (make-tank 10 3)) #false))
(check-expect (si-move-proper (make-sigs (make-posn 40 20) (make-tank 10 3) (make-posn 10 150)) 2) (make-sigs (refresh-ufo (make-posn 40 20) 2) (refresh-tank (make-tank 10 3)) (refresh-missile (make-posn 10 150))))
(check-expect (si-move-proper (make-sigs (make-posn 40 20) (make-tank 10 3) (make-posn 10 150)) 3) (make-sigs (refresh-ufo (make-posn 40 20) 3) (refresh-tank (make-tank 10 3)) (refresh-missile (make-posn 10 150))))

(define (si-move-proper si r)
  (cond
    [(boolean? (sigs-missile si)) (make-sigs (refresh-ufo (sigs-ufo si) r) (refresh-tank (sigs-tank si)) #false)]
    [(posn? (sigs-missile si)) (make-sigs (refresh-ufo (sigs-ufo si) r) (refresh-tank (sigs-tank si)) (refresh-missile (sigs-missile si)))]))

; refresh missile
; Missile -> Missile
; Moves the missile from Tank's loc to top on a straight line
(check-expect (refresh-missile (make-posn 20 150)) (make-posn 20 (- 150 SPEED-MISSILE)))

(define (refresh-missile m)
  (make-posn (posn-x m) (- (posn-y m) SPEED-MISSILE)))

; refresh tank
; Tank -> Tank
; Moves the tank between the canvas space
(check-expect (refresh-tank (make-tank 20 3)) (make-tank 23 3))
(check-expect (refresh-tank (make-tank 2000 3)) (make-tank (- WORLD-WIDTH HALF-X-TANK) 3))
(check-expect (refresh-tank (make-tank 0 2)) (make-tank HALF-X-TANK 2))

(define (refresh-tank t)
  (cond
    [(> (tank-loc t) (- WORLD-WIDTH HALF-X-TANK)) (make-tank (- WORLD-WIDTH HALF-X-TANK) (tank-vel t))]
    [(< (tank-loc t) HALF-X-TANK) (make-tank HALF-X-TANK (tank-vel t))]
    [else (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t))]))

; refresh ufo
; Ufo Number -> Ufo
; Moves the UFO vertically with a constant speed and
; jumps randomly to the right or left
(check-expect (refresh-ufo (make-posn 50 20) 0) (make-posn (- 50 JUMP) (+ 20 SPEED-UFO)))
(check-expect (refresh-ufo (make-posn 30 10) 1) (make-posn (+ 30 JUMP) (+ 10 SPEED-UFO)))
(check-expect (refresh-ufo (make-posn 22 8) 2) (make-posn 22 (+ 8 SPEED-UFO)))
(check-expect (refresh-ufo (make-posn 40 5) 3) (make-posn 40 (+ 5 SPEED-UFO)))

(define (refresh-ufo u r)
  (cond 
    [(= r 0) (make-posn (- (posn-x u) JUMP) (+ (posn-y u) SPEED-UFO))]
    [(= r 1) (make-posn (+ (posn-x u) JUMP) (+ (posn-y u) SPEED-UFO))]
    [(or (= r 2) (= r 3)) (make-posn (posn-x u) (+ (posn-y u) SPEED-UFO))]))



;; KEY EVENT

; SIGS KeyEvent -> SIGS
; pressing the left arrow ensures that the tank moves left
; pressing the right arrow ensures that the tank moves right
; pressing the space bar fires the missile if it hasn’t been launched yet.
(check-expect (si-control sitest1 "left") (turn-left sitest1))
(check-expect (si-control sitest2 "right") (turn-right sitest2))
(check-expect (si-control sitest1 " ") (fire-m sitest1))
(check-expect (si-control sitest1 "z") sitest1)

(define (si-control si ke)
  (cond
    [(string=? "left" ke) (turn-left si)]
    [(string=? "right" ke) (turn-right si)]
    [(string=? " " ke) (fire-m si)]
    [else si]))

; SIGS -> SIGS
; pressing the left arrow ensures that the tank moves left
(check-expect (turn-left (make-sigs (make-posn 90 20) (make-tank 10 3) #false)) (make-sigs (make-posn 90 20) (make-tank 10 -3) #false))
(check-expect (turn-left (make-sigs (make-posn 90 20) (make-tank 23 -9) (make-posn 23 150))) (make-sigs (make-posn 90 20) (make-tank 23 -9) (make-posn 23 150)))

(define (turn-left si)
  (make-sigs (sigs-ufo si)
             (go-left si)
             (sigs-missile si)))

(define (go-left si)
  (cond [(<= 0 (tank-vel (sigs-tank si)))
         (make-tank (tank-loc (sigs-tank si)) (- 0 (tank-vel (sigs-tank si))))]
        [else (sigs-tank si)]))

; SIGS -> SIGS
; pressing the right arrow ensures that the tank moves right
(check-expect (turn-right (make-sigs (make-posn 90 20) (make-tank 10 3) #false)) (make-sigs (make-posn 90 20) (make-tank 10 3) #false))
(check-expect (turn-right (make-sigs (make-posn 90 20) (make-tank 23 -9) (make-posn 23 150))) (make-sigs (make-posn 90 20) (make-tank 23 9) (make-posn 23 150)))

(define (turn-right si)
  (make-sigs (sigs-ufo si)
             (go-right si)
             (sigs-missile si)))

(define (go-right si)
  (cond [(< (tank-vel (sigs-tank si)) 0)
         (make-tank (tank-loc (sigs-tank si)) (- 0 (tank-vel (sigs-tank si))))]
        [else (sigs-tank si)]))
  
; SIGS -> SIGS
; pressing the space bar fires the missile if it hasn’t been launched yet.
(check-expect (fire-m (make-sigs (make-posn 45 30) (make-tank 40 3) #false)) (make-sigs (make-posn 45 30) (make-tank 40 3) (make-posn 40 (- Y-TANK HALF-Y-TANK))))
(check-expect (fire-m (make-sigs (make-posn 45 30) (make-tank 40 3) (make-posn 50 100))) (make-sigs (make-posn 45 30) (make-tank 40 3) (make-posn 50 100)))

(define (fire-m si)
  (cond
    [(boolean? (sigs-missile si)) (make-sigs (sigs-ufo si) (sigs-tank si) (make-posn (tank-loc (sigs-tank si)) (- Y-TANK HALF-Y-TANK)))]
    [else si]))


(define (main si)
  (big-bang si
    [to-draw si-render.v2]
    [on-tick si-move]
    [on-key si-control]
    [stop-when si-game-over?]))

(define sitest1 (make-sigs (make-posn 100 10) (make-tank 15 3) #false))
(define sitest2 (make-sigs (make-posn 100 10) (make-tank 15 3) (make-posn 15 150)))