;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 190 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; L-1String -> List-of-prefixes
; Consumes a list of 1Strings and produces the list of all prefixes
(check-expect (prefixes '()) '())
(check-expect (prefixes (list "a")) (list (list "a")))
(check-expect (prefixes (list "a" "b")) (list (list "a") (list "a" "b")))
(check-expect (prefixes (list "a" "b" "c")) (list (list "a") (list "a" "b") (list "a" "b" "c")))

(define (prefixes lo1s)
  (prefixes-aux lo1s lo1s))


; Auxiliar function
(define (prefixes-aux lo1s save)
  (cond [(empty? lo1s) '()]
        [else
         (cons (sl (first lo1s) save)
               (prefixes-aux (rest lo1s) save))]))


; 1String L-1String -> L-1String
(check-expect (sl "a" (list "a" "b" "c")) (list "a"))
(check-expect (sl "b" (list "a" "b" "c")) (list "a" "b"))
(check-expect (sl "c" (list "a" "b" "c")) (list "a" "b" "c"))

(define (sl s l)
  (cond
    [(string=? s (first l)) (list s)]
    [else (cons (first l) (sl s (rest l)))]))