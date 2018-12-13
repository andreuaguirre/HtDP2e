;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 240 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct layer [stuff])


; An LStr is one of:
; – String
; – (make-layer LStr)
(define LSTR0 "abcd")
(define LSTR1 (make-layer "abcd"))
(define LSTR2 (make-layer (make-layer (make-layer "abcd"))))

; An LNum is one of:
; – Number
; – (make-layer LNum)
(define LNUM0 4)
(define LNUM1 (make-layer 10))
(define LNUM2 (make-layer (make-layer (make-layer 2))))


; An LItem is one of:
; - Item
; - (make-layer LItem)
; Cond: A layer cannot combine different items
(define LITEM1 (make-layer "abcd"))
(define LITEM2 (make-layer 10))