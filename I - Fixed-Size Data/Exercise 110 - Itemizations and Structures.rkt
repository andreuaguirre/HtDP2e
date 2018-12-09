;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 110 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number
; computes the area of a disk with radius r
(check-expect (area-of-disk 2) 12.56)

(define (area-of-disk r)
  (* 3.14 (* r r)))

; Any -> ???
(define (checked-f v)
  (cond
    [(number? v) ...]
    [(boolean? v) ...]
    [(string? v) ...]
    [(image? v) ...]
    [(posn? v) (...(posn-x v) ... (posn-y v) ...)]
    ...
    ; which selectors are needed in the next clause?
    [(tank? v) ...]
    ...))

; Any -> Number
; computes the area of a disk with radius v, 
; if v is a number
(check-expect (checked-area-of-disk 2) 12.56)
(check-error (checked-area-of-disk -2) ERRORMSG)
(check-error (checked-area-of-disk #true) ERRORMSG)
(check-error (checked-area-of-disk (make-posn 2 3)) ERRORMSG)

(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (>= v 0)) (area-of-disk v)]
    [else (error ERRORMSG)]))

(define ERRORMSG "area-of-disk: number expected")