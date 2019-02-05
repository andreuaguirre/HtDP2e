;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 273 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [X -> Y] [List-of X] -> [List-of Y]
(check-expect (map.v2 string-length (list "a" "ab" "abc"))
              (map string-length (list "a" "ab" "abc")))

(define (map.v2 f l)
  (local (; X [List-of Y] -> [List-of Y]
          (define (helper x ly)
            (cons (f x) ly)))
    (foldr helper '() l)))