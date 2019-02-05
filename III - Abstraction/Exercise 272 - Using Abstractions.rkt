;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 272 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [List-of X] [List-of X] -> [List-of X]
; Appends two lists
(check-expect (append-from-foldr (list 1 2 3) (list 4 5 6)) (append (list 4 5 6) (list 1 2 3)))
(check-expect (append-from-foldl (list 1 2 3) (list 4 5 6)) (append (reverse (list 4 5 6)) (list 1 2 3)))

(define (append-from-foldr l1 l2)
  (foldr cons l1 l2))

(define (append-from-foldl l1 l2)
  (foldl cons l1 l2))


; [List-of N] -> N
; Computes the sum of all the Numbers on a [List-of Number]
(check-expect (sum-from-fold (list 1 2 3 4 5)) (+ 1 2 3 4 5))

(define (sum-from-fold l)
  (foldr + 0 l))

; [List-of N] -> N
; Computes the product of all the Numbers on a [List-of Number]
(check-expect (product-from-fold (list 1 2 3 4 5)) (* 1 2 3 4 5))

(define (product-from-fold l)
  (foldr * 1 l))



(define DOT (circle 8 "solid" "red"))
(define STAR (star 15 "solid" "black"))

; Image Number -> Image
; Produces an image N times horizontally
(check-expect (gen-image-h (list DOT STAR DOT)) (beside DOT STAR DOT))

(define (gen-image-h l)
  (foldr beside empty-image l))


; Image Number -> Image
; Produces an image N times vertically
(check-expect (gen-image-v (list DOT STAR DOT)) (above DOT STAR DOT))

(define (gen-image-v l)
  (foldr above empty-image l))