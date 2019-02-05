;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 274 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; String -> [List-of String]
(check-expect (prefixes "a") (list "a"))
(check-expect (prefixes "ab") (list "a" "ab"))
(check-expect (prefixes "abc") (list "a" "ab" "abc"))

(define (prefixes s)
  (local (; N -> String
          (define (helper n)
            (substring s 0 (add1 n))))
    (build-list (string-length s) helper)))