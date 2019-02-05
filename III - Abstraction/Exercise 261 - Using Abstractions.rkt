;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 261 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct ir [name price])
; An IR is a structure:
;   (make-IR String Number)
(define IR1 (make-ir "tomatoe" 1.5))
(define IR2 (make-ir "orange" 0.5))
(define IR3 (make-ir "apple" 1))
(define IR4 (make-ir "rice" 0.7))
(define IR5 (make-ir "meat" 3))
(define IR6 (make-ir "water" 0.2))

; An Inventory is one of: 
; – '()
; – (cons IR Inventory)
(define INV1 (list IR1 IR2 IR3 IR4 IR5 IR6))
(define INV-E (list IR2 IR3 IR4 IR6))


; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
(check-expect (extract2 INV1) INV-E)

(define (extract2 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (local ((define extract-rest (extract2 (rest an-inv))))
       (cond
         [(<= (ir-price (first an-inv)) 1.0) (cons (first an-inv) extract-rest)]
         [else extract-rest]))]))

; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
(check-expect (extract1 INV1) INV-E)

(define (extract1 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (cond
       [(<= (ir-price (first an-inv)) 1.0)
        (cons (first an-inv) (extract1 (rest an-inv)))]
       [else (extract1 (rest an-inv))])]))



;; There's no difference on performance