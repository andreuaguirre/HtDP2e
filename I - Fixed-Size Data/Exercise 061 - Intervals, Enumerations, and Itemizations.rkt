;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 61 - Intervals, Enumerations, and Itemizations|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;physical constants
(define TL (place-image (circle 5 "outline" "red") 10 7.5
                        (place-image (circle 5 "outline" "yellow") 25 7.5
                        (place-image (circle 5 "outline" "green") 40 7.5
                                     (empty-scene 50 15)))))
(define RB (circle 5 "solid" "red"))
(define GB (circle 5 "solid" "green"))
(define YB (circle 5 "solid" "yellow"))
(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(define (tl-next-numeric cs)
  (modulo (+ cs 1) 3))

;TrafficLight -> Image
;renders the current state cs as an image
(check-expect (tl-render 0)(place-image RB 10 7.5 TL))
(check-expect (tl-render 2)(place-image YB 25 7.5 TL))
(check-expect (tl-render 1)(place-image GB 40 7.5 TL))

(define (tl-render current-state)
  (cond
    [(= current-state RED)(place-image RB 10 7.5 TL)]
    [(= current-state YELLOW)(place-image YB 25 7.5 TL)]
    [(= current-state GREEN)(place-image GB 40 7.5 TL)]))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-numeric 1]))

(traffic-light-simulation 0)