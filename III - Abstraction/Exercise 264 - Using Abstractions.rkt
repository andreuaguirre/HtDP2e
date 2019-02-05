;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 264 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Nelon -> Number
; determines the highest number on l
(define (sup l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (local ((define highest-in-rest (sup (rest l))))
       (if (> (first l) highest-in-rest)
           (first l)
           highest-in-rest))]))


; Exercise 264. Use DrRacket’s stepper to calculate out how it evaluates

(sup (list 2 1 3))