;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 165 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; String String List-of-strings -> List-of-strings
; Consumes two strings, called new and old, and a list of strings.
; It produces a new list of strings by substituting all occurrences of old with new
(check-expect (substitute "abc" "qwe" '()) '())
(check-expect (substitute "black" "white" (cons "orange" (cons "black" (cons "white" '())))) (cons "orange" (cons "white" (cons "white" '()))))

(define (substitute old new los)
  (cond
    [(empty? los) '()]
    [else (cons (if (equal? old (first los)) new (first los)) (substitute old new (rest los)))]))

; A list-of-strings is one of:
; - '()
; - (cons String list-of-strings)
(define los1 '())
(define los2 (cons "orange" (cons "laptop" '())))



; List-of-toys -> List-of-toys
; Consumes a list of toys
; If there's any "robot" String in there, converts it to a "r2d2" String
(check-expect (subst-robot '()) '())
(check-expect (subst-robot (cons "lego" (cons "robot" (cons "spiderman" (cons "robot" '()))))) (cons "lego" (cons "r2d2" (cons "spiderman" (cons "r2d2" '())))))

(define (subst-robot lot)
  (cond
    [(empty? lot) '()]
    [else (cons (sconv (first lot)) (subst-robot (rest lot)))]))

; String -> String
; Converts a "robot" String into a "rd2d" String
; If the string is not "robot", returns it the same
(check-expect (sconv "robot") "r2d2")
(check-expect (sconv "lego") "lego")

(define (sconv s)
  (if
   (string=? "robot" s)
   "r2d2"
   s))

; A list-of-toys is one of:
; - '()
; - (cons String list-of-toys)
(define lot1 '())
(define lot2 (cons "lego" (cons "robot" '())))