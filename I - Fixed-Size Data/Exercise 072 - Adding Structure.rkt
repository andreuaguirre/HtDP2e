;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 72 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area number])
; a phone is a structure
; (make-phone (Number Number))
; gives a phone number and it's area

(define-struct phone# [area switch num])
; a phone is a structure
; (make-phone Number Number Number))
; interpretation (make-phone area switch num)
; area: 3 digits for the area code [100, 999]
; switch: 3 digits for phone switch [100, 999]
; num: 4 digits for phone number [0001, 9999]