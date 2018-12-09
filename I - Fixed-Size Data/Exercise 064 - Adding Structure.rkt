;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 64 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;Posn -> Number
;Gives the "Manhattan distance" from a given posn to the origin
(check-expect (manhattan-distance (make-posn 0 0)) 0)
(check-expect (manhattan-distance (make-posn 3 5)) 8)

(define (manhattan-distance posn)
  (+ (posn-x posn)
     (posn-y posn)))