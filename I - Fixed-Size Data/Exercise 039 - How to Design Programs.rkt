;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 039 - How to Design Programs|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define WHEEL-RADIUS 5.5)
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define WHEEL-DISTANCE (* WHEEL-RADIUS 4))
(define CAR-BODY (overlay/align "middle" "bottom" (rectangle (* 5 WHEEL-RADIUS) (* 4 WHEEL-RADIUS) "solid" "red")
                                (rectangle (* 11 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")))
(define SPACE (rectangle WHEEL-DISTANCE 0 "outline" "transparent"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR (above CAR-BODY BOTH-WHEELS))