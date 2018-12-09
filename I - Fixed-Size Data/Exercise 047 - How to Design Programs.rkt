;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 47 - Functions and Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;physical constants
(define (happiness-meter ws)
(place-image
 (rectangle ws 10 "solid" "red")
 50 5
 (rectangle 100 10 "solid" "black")))

;worldstate is a number which represents the length of the
;happiness meter (red rectangle)

;worldstate -> worldstate
;reduce -0.1 happiness for clock tick
(define (tock ws) (- ws 0.1))

; worldstate -> worldstate key-event
;when down arrow key is pressed, happiness increseas by 1/5
;when up arrow key is pressed, happiness increseas by 1/3
(define (arrow-key-down ws) (+ (/ ws 5) ws))
(define (arrow-key-up ws) (+ (/ ws 3) ws))

(define (change ws ke)
  (cond
    [(key=? ke "up")(arrow-key-up ws)]
    [(key=? ke "down")(arrow-key-down ws)]))


(define (gauge-prog ws)
(big-bang ws
  [to-draw happiness-meter]
  [on-tick tock]
  [on-key change]))

(gauge-prog 100)