;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 122 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 122. Suppose the program contains these definitions:

(define (f x y)
  (+ (* 3 x)
     (* y y)))

; Show how DrRacket evaluates the following expressions, step-by-step:

(+ (f 1 2) (f 2 1))

(f 1 (* 2 3))

(f (f 1 (* 2 3)) 19)


; Use DrRacket’s stepper to confirm your computations.