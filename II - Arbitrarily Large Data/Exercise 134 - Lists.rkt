;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 134 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 134. Develop the contains? function, which determines whether
; some given string occurs on a given list of strings.

; String List -> Boolean
; Determines whether a given String occurs on a given List of strings
(check-expect (contains? "hello world" (cons "a" (cons "b" (cons "c" (cons "hello world" '()))))) #true)
(check-expect (contains? "hello world" (cons "a" (cons "b" (cons "c" '())))) #false)
(check-expect (contains? "hello world" '()) #false)

(define (contains? str list)
  (cond
    [(empty? list) #false]
    [else (or (equal? (first list) str)
              (contains? str (rest list)))]))