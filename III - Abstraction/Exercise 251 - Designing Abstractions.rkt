;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 251 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [List-of Numbers] Number [Number Number -> Number] -> Number
(check-expect (fold1 '(1 2 3 4 5) 0 +) (sum '(1 2 3 4 5)))
(check-expect (fold1 '(1 2 3 4 5) 1 *) (product '(1 2 3 4 5)))

(define (fold1 l i g)
  (cond
    [(empty? l) i]
    [else
     (g (first l)
        (fold1 (rest l) i g))]))


; [List-of Number] -> Number
; computes the sum of the numbers on l
(check-expect (fold1-sum '(1 2 3 4 5)) (+ 1 2 3 4 5))

(define (fold1-sum l)
  (fold1 l 0 +))

; [List-of Number] -> Number
; computes the product of the numbers on l
(check-expect (fold1-product '(1 2 3 4 5)) (* 1 2 3 4 5))

(define (fold1-product l)
  (fold1 l 1 *))




; __________________________________________________________



; [List-of Number] -> Number
; computes the sum of the numbers on l
(define (sum l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (sum (rest l)))]))


; [List-of Number] -> Number
; computes the product of the numbers on l
(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))