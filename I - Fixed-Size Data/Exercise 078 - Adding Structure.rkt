;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 78 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;; three.letter is one of
; 1String [a,z]
; #false
; interp. lower case letters [a,z] or no letter

(define L1 "a")
(define L2 "k")
(define L3 #false)


(define-struct word3 [let1 let2 let3])
; word3 is a structure
; (make-word3 LCL LCL LCL)
; interp.  word3 consists of 3 lower case letters

(define WORD1 (make-word3 "c" "a" "t"))
(define WORD2 (make-word3 "d" "o" "g"))
(define WORD3 (make-word3 "m" "e" #false))