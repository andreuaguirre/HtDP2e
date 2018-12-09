;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 51 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;physical constants
(define TL-WIDTH 30)
(define TL-HEIGHT 30)
(define LED-RADIUS 10)
(define (LED ws) (circle LED-RADIUS "solid" (colorchange ws)))
(define (TRAFFIC-LIGHT ws)
  (place-image (LED ws) (/ TL-WIDTH 2) (/ TL-HEIGHT 2)
               (rectangle TL-WIDTH TL-HEIGHT "solid" "black")))

;worldstate is a color (red-yellow-green)
;traffic light changes color through time

;worldstate -> string
;changes the color of the LED through time
(check-expect (colorchange 40) "green")
(check-expect (colorchange 60) "yellow")
(check-expect (colorchange 80) "red")
(define (colorchange ws)
  (cond
    [(<= 0 ws 50) "green"]
    [(and (< 50 ws) (>= 70 ws)) "yellow"]
    [else "red"]))

;worldstate -> worldstate
;time passes through tick clocks
;restarts the program when 110 tocks passed
(check-expect (tock 5) 6)
(check-expect (tock 110) 0)
(define (tock ws)
  (cond
    [(<= 110 ws) 0]
    [else (+ ws 1)]))

(define (main ws)
  (big-bang ws
    [to-draw TRAFFIC-LIGHT]
    [on-tick tock]))

(main 0)