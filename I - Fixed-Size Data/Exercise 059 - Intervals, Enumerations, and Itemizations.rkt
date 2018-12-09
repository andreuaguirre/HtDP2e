;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 59 - Intervals, Enumerations, and Itemizations|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;physical constants
(define TL (place-image (circle 5 "outline" "red") 10 7.5
                        (place-image (circle 5 "outline" "yellow") 25 7.5
                        (place-image (circle 5 "outline" "green") 40 7.5
                                     (empty-scene 50 15)))))
(define RB (circle 5 "solid" "red"))
(define GB (circle 5 "solid" "green"))
(define YB (circle 5 "solid" "yellow"))

;TrafficLight -> TrafficLight
;yields the next state given current state s
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")

(define (tl-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

;TrafficLight -> Image
;renders the current state cs as an image
(check-expect (tl-render "red")(place-image RB 10 7.5 TL))
(check-expect (tl-render "yellow")(place-image YB 25 7.5 TL))
(check-expect (tl-render "green")(place-image GB 40 7.5 TL))

(define (tl-render current-state)
  (cond
    [(string=? current-state "red")(place-image RB 10 7.5 TL)]
    [(string=? current-state "yellow")(place-image YB 25 7.5 TL)]
    [(string=? current-state "green")(place-image GB 40 7.5 TL)]))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

(traffic-light-simulation "green")