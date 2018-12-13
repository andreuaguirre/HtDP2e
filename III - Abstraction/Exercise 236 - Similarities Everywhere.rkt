;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 236 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Lon -> Lon
; adds or substracts a given number to each number of a Lon
(check-expect (plus 3 '(0 1 2 3 4)) '(3 4 5 6 7))
(check-expect (plus -2 '(0 1 2 3 4)) '(-2 -1 0 1 2))

(define (plus n l)
  (cond
    [(empty? l) '()]
    [else (cons (+ (first l) n) (plus n (rest l)))]))


; Lon -> Lon
; Substract 2 from each number of a given list
(check-expect (sub2 '(2 3 4 5 6)) '(0 1 2 3 4))

(define (sub2 l)
  (plus -2 l))

; Lon -> Lon
; adds 1 to each item on l
(check-expect (plus1 '(0 1 2 3 4)) '(1 2 3 4 5))

(define (plus1 l)
  (plus 1 l))

; Lon -> Lon
; adds 5 to each item on l
(check-expect (plus5 '(0 1 2 3 4)) '(5 6 7 8 9))

(define (plus5 l)
  (plus 5 l))




; Create test suites for the following two functions:

; Lon -> Lon
; adds 1 to each item on l
(check-expect (add1* '(0 1 2 3 4)) '(1 2 3 4 5))

(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (add1 (first l))
       (add1* (rest l)))]))

; Lon -> Lon
; adds 5 to each item on l
(check-expect (plus5* '(0 1 2 3 4)) '(5 6 7 8 9))

(define (plus5* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (+ (first l) 5)
       (plus5* (rest l)))]))