;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 81 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct pnt [hours minutes seconds])
; pnt (point in time) is a structure
; (make-pnt Number Number Number)
; interpretation: hours minutes and seconds of time
; template:
(define pntexample (make-pnt 12 30 02))
(define (fn-pnt x)
  (... (... (pnt-hours x))
       (... (pnt-minutes x))
       (... (pnt-seconds)x)))


; pointintime -> Number
; converts hours minutes and seconds -> seconds
; (time->seconds pnt) Number)
; (time->seconds (make-pnt Hours Minutes Seconds) Seconds)
(check-expect (time->seconds (make-pnt 12 30 02))
              45002)

(define (time->seconds t)
  (+ (* 3600 (pnt-hours t))
     (* 60 (pnt-minutes t))
     (pnt-seconds t)))