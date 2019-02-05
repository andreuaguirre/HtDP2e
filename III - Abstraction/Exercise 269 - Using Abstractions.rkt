;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 269 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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
(define LINV4 (list INV1 INV3 INV4))           ; sales price < 50
(define LINV5 (list INV2 INV3 INV4 INV5))      ; not "apple"


; Number [List-of Inventory] -> [List-of Inventory]
; Consumes a number ua, and a list of inventory records to produce
; a list of all those structures whose sales price is below ua
(check-expect (eliminate-expensive 50 LINV1) LINV4)

(define (eliminate-expensive ua l)
  (local (; Inventory -> Boolean
          ; Compares if ua is < than an inventory-sprice
          (define (expensive? i)
            (< (inventory-sprice i) ua)))

    (filter expensive? l)))


; String [List-of Inventory] -> [List-of Inventory]
; consumes the name of an inventory item, called ty, and a list of inventory records
; and which produces a list of inventory records that do not use the name ty.
(check-expect (recall "apple" LINV1) LINV5)

(define (recall ty l)
  (local (; Inventory -> Boolean
          ; Is the Inventory called ty?
          (define (inv-name? i)
            (not (string=? ty (inventory-name i)))))

    (filter inv-name? l)))


; [List-of String] [List-of String] -> [List-of String]
; Consumes two lists of names and selects all those from the second one that are also on the first.
(check-expect (selection (list "A" "B" "C" "D" "E") (list "f" "g" "B" "E" "h"))
              (list "B" "E"))

(define (selection l1 l2)
  (local (; String -> Boolean
          ; Is the string on the list?
          (define (same-name? s)
            (member? s l1)))

    (filter same-name? l2)))