;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 82 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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


; word3 + word3 -> compare-word
; compares 2 functions word3 with each other
;and makes a third with #false on the differences
(check-expect (compare-word (make-word3 "a" "b" "c")
                            (make-word3 "z" "b" "e"))
              (make-word3 #false "b" #false))

(define (compare-word w1 w2)
  (make-word3
   (if
    (string=? (word3-let1 w1) (word3-let1 w2))
    (word3-let1 w1)
    #false)
   (if
    (string=? (word3-let2 w1) (word3-let2 w2))
    (word3-let2 w1)
    #false)
   (if
    (string=? (word3-let3 w1) (word3-let3 w2))
    (word3-let3 w1)
    #false)))