;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 181 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 181. Use list to construct the equivalent of these lists:

; 1.
(check-expect (list "a" "b" "c" "d") (cons "a" (cons "b" (cons "c" (cons "d" '())))))

; 2.
(check-expect (list (list 1 2)) (cons (cons 1 (cons 2 '())) '()))

; 3.
(check-expect (list "a" (list 1) #false) (cons "a" (cons (cons 1 '()) (cons #false '()))))

; 4.
(check-expect (list (list "a" 2) "hello") (cons (cons "a" (cons 2 '())) (cons "hello" '())))



; Also try your hand at this one:

(check-expect (list (list 1 2) (list 2)) (cons (cons 1 (cons 2 '())) (cons (cons 2 '()) '())))