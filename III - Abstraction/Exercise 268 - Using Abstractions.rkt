;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 268 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct inventory [name description aprice sprice])
; An Inventory is a struct:
; (make-inventory String String Number Number)
(define INV1 (make-inventory "apple" "green tasty apple" 0.5 1))
(define INV2 (make-inventory "mobile" "iphone xs mobile phone" 500 1000))
(define INV3 (make-inventory "rice" "basmati rice from asia" 1 2))
(define INV4 (make-inventory "gum" "strawberry gum" 0.1 0.3))
(define INV5 (make-inventory "laptop" "asus i5 laptop" 300 650))

; [List-of Inventory]
(define LINV1 (list INV1 INV2 INV3 INV4 INV5)) ; not sorted
(define LINV2 (list INV2 INV5 INV3 INV1 INV4)) ; sorted >
(define LINV3 (list INV4 INV1 INV3 INV5 INV2)) ; sorted <

; [List-of Inventory] -> [List-of Inventory]
; Sorts a list of inventory records by the difference between the two prices
(check-expect (sort-inv LINV1) LINV2)
(check-expect (sort-inv LINV3) LINV2)

(define (sort-inv l)
  (local (; Inventory Inventory -> Boolean
          ; Compares two Inventories and returns a #t boolean if the
          ; first has higher gains than the second
          (define (inv-value?> i1 i2)
            (> (inv-gains i1) (inv-gains i2)))          

          ; Inventory -> Number
          ; Computes the difference between inventory-sprice and inventory-aprices
          ; Interp: (- (Recommended sales prices) (Acquisition price))
          (define (inv-gains i)
            (- (inventory-sprice i) (inventory-aprice i))))
    
    (sort l inv-value?>)))