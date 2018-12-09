;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise15.sunnyfriday.function) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;sunny ==> friday
(define (==> x y)
 (if (not x)
     #true
     (and x y)))

;test
(check-expect (==> true true) true)
(check-expect (==> true false) false)
(check-expect (==> false true) true)
(check-expect (==> false false) true)