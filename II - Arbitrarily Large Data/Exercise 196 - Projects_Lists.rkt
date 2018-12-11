;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 196 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines "dictionary.txt")) ; I downloaded a dictionary.txt
(define LITTLE-DICT (list "this" "is" "a" "little" "dictionary" "to" "test" "functions"))


; A Letter-Counts is a struct
;   (make-lettercounts String Number)
; String is a Letter
; Number is the number of times the letter is used as the first one of a word
(define-struct lettercounts (letter counts))

(define lettercounts1 (make-lettercounts "a" 25)) ; Letter "a" is used 25 times as the first letter of a word


; A lolc or List-of-Letter-Counts is one of:
; - '()
; - (cons Letter-Counts lolc)
(define lolc1 '())
(define lolc2 (cons lettercounts1 '()))


; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))



;; MAIN FUNCTION
; Dictonary -> List-of-Letter-Counts
; Consumes a Dictionary and counts how often each letter is used
; as the first one of a word in the given dictionary.
(check-expect (count-by-letter LITTLE-DICT) (count-by-letter* LETTERS LITTLE-DICT))

(define (count-by-letter d)
  (count-by-letter* LETTERS d))

; List-of-letters Dictionary -> List-of-Letter-Counts
; Auxilar function for count-by-letter
(check-expect (count-by-letter* '() LITTLE-DICT) '())
(check-expect (count-by-letter* (list "a" "t" "z") LITTLE-DICT)
              (list (start-withlc "a" LITTLE-DICT) (start-withlc "t" LITTLE-DICT) (start-withlc "z" LITTLE-DICT)))

(define (count-by-letter* ll d)
  (cond
    [(empty? ll) '()]
    [else (cons (start-withlc (first ll) d) (count-by-letter* (rest ll) d))]))

; Letter Dictionary -> Letter-Counts
; Consumes a letter and returns its letter-count
(check-expect (start-withlc "a" LITTLE-DICT) (make-lettercounts "a" (starts-with# "a" LITTLE-DICT)))
(check-expect (start-withlc "t" LITTLE-DICT) (make-lettercounts "t" (starts-with# "t" LITTLE-DICT)))

(define (start-withlc l d)
  (make-lettercounts l (starts-with# l d)))

; Letter Dictionary -> Number
; Consumes a Letter and Dictionary and then counts
; how many words in the given Dictionary start with the given Letter. 
(check-expect (starts-with# "z" LITTLE-DICT) 0)
(check-expect (starts-with# "a" LITTLE-DICT) 1)
(check-expect (starts-with# "t" LITTLE-DICT) 3)

(define (starts-with# l d)
  (cond
    [(empty? d) 0]
    [else (+ (countletter (first d) l) (starts-with# l (rest d)))]))


; String Letter -> Number
; If the first letter of a string equals a given letter, returns 1
; If not, returns 0
(check-expect (countletter "cat" "c") 1)
(check-expect (countletter "dog" "b") 0)

(define (countletter s l)
  (if
    (string=? l (first (explode s)))
    1
    0))