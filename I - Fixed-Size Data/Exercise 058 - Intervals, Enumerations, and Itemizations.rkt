;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 58 - Intervals, Enumerations, and Itemizations|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Price falls into one of the three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.

;constant definitions
(define (LOW-PRICE-TAX p) (* 0.05 p))
(define (LUXURY-PRICE-TAX p) (* 0.08 p))
(define LOW-PRICE-INTERVAL 1000)
(define LUXURY-PRICE-INTERVAL 10000)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) 50)
(check-expect (sales-tax 1282) 64.1)
(check-expect (sales-tax 10000) 800)
(check-expect (sales-tax 12017) 961.36)

(define (sales-tax p)
  (cond
    [(> 1000 p) 0]
    [(and (>= p LOW-PRICE-INTERVAL)(> LUXURY-PRICE-INTERVAL p)) (LOW-PRICE-TAX p)]
    [(>= p LUXURY-PRICE-INTERVAL) (LUXURY-PRICE-TAX p)]))