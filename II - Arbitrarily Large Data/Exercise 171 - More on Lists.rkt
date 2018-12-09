;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 171 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Los (short for list-of-strings) is one of:
; - '()
; - (cons String Los)
(define los1 '())
(define los2 (cons "black" '()))


; A LLS (short of list-of-list-of-strings) is one of:
; - '()
; - (cons Los LLS)
(define lls1 '())
(define lls2 (cons los2 (cons los1 '())))