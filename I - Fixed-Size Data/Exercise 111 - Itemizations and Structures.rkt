;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 111 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector
(define-struct vec [x y])

; Vec -> Vec
; Makes a Vec if it's well written (make-vec PositiveNumber PositiveNumber))
; if not, error
(check-expect (checked-make-vec (make-vec 2 3)) (make-vec 2 3))
(check-error (checked-make-vec (make-vec -2 1)) "vec-x vex-y: PositiveNumber expected")
(check-error (checked-make-vec (make-vec -2 -1)) "vec-x vex-y: PositiveNumber expected")
(check-error (checked-make-vec (make-vec #true 1)) "vec-x vex-y: PositiveNumber expected")
(check-error (checked-make-vec (make-vec 2 "hellow world")) "vec-x vex-y: PositiveNumber expected")

(define (checked-make-vec v)
  (cond
    [(and (number? (vec-y v))
          (number? (vec-x v))
          (>= (vec-x v) 0)
          (>= (vec-y v) 0)) v]
    [else (error "vec-x vex-y: PositiveNumber expected")]))