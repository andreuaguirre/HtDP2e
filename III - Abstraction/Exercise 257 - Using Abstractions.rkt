;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 257 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [X] N [N -> X] -> [List-of X]
(check-expect (build-l*st 5 add1) (build-list 5 add1))

(define (build-l*st n f)
  (cond
    [(zero? n) '()]
    [else (add-at-end (f (sub1 n)) (build-l*st (sub1 n) f))]))


;; [X] X [List-of X] -> [List-of X]
(define (add-at-end x l)
  (cond
   [(empty? l) (list x)]
   [else (cons (first l)
               (add-at-end x (rest l)))]))