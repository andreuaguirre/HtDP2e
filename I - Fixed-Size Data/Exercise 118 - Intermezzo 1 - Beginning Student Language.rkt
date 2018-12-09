;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 118 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;Exercise 118. Take a look at the following sentences:

;1. (define (f x) x)

;2. (define (f x) y)

;3. (define (f x y) 3)

;Explain why they are syntactically legal definitions



;; 1. It's a legal definition (define (variable variable) expr)

;; 2. It's a legal definition (define (variable variable) expr)

;; 3. It's a legal definition (define (variable variable variable) expr)