;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 147 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; NEList-of-boolean -> Boolean
; Consumes a NEList-of-boolean and determines whether all of them are #true.
; Interp: If there is any #false boolean, #false
;         If not, #true
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #false '())) #false)
(check-expect (all-true (cons #true (cons #true (cons #true '())))) #true)
(check-expect (all-true (cons #true (cons #false (cons #true '())))) #false)

(define (all-true ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (and (first ne-l) (all-true (rest ne-l)))]))

; NEList-of-boolean -> Boolean
; Consumes a NEList-of-boolean and determines if one of them is #true.
; Interp: If there is any #true boolean, #true
;         If not, #false
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #false (cons #true (cons #false '())))) #true)
(check-expect (one-true (cons #false (cons #false (cons #false '())))) #false)

(define (one-true ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (or (first ne-l) (one-true (rest ne-l)))]))

; A NEList-of-boolean is one of:
; - (cons Boolean '())
; - (cons Boolean NEList-of-boolean)
; Interp: Non-empty list of boolean
(define nelist-of-boolean1 (cons #true '()))
(define nelist-of-boolean2 (cons #true (cons #false '())))