;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 198 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines "dictionary.txt")) ; I downloaded a dictionary.txt
(define LITTLE-DICT (list "this" "is" "a" "little" "dictionary" "to" "test" "functions"))

; A List-of-Dictionarys is one of:
; - (cons '() '())
; - (cons Dictionary List-of-Dictionary)
; Each Dictionary is for a specific Letter
(define lod1 (list (list "a") (list "dictionary") (list "functions") (list "is") (list "little") (list "this" "to" "test")))


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



; Dictionary -> Letter-Counts
; Consumes a Dictionary and produces a Letter-Counts for the most frequent one on the Dictionary
(check-expect (most-frequent.v2 LITTLE-DICT) (most-frequent LITTLE-DICT))

(define (most-frequent.v2 d)
  (first (sort-lolc (countlist (words-by-first-letter d)))))

; List-of-Dictionary -> List-of-Letter-Counts
(check-expect (countlist '()) '())
(check-expect (countlist (list (list "aa" "aaa" "asd") (list "b" "bbb") (list "cc")))
              (list (make-lettercounts "a" 3) (make-lettercounts "b" 2) (make-lettercounts "c" 1)))

(define (countlist lod)
  (cond
    [(empty? lod) '()]
    [else (cons (make-lettercounts (first (explode (first (first lod)))) (length (first lod))) (countlist (rest lod)))]))


; Dictionary -> List-of-Dictionarys
; Consumes a Dictionary and produces a list of Dictionarys, one per Letter.
(check-expect (words-by-first-letter LITTLE-DICT) lod1)
(check-expect (words-by-first-letter (list "aa" "b" "cc" "aaa" "d" "dd" "bbb"))
              (list (list "aa" "aaa") (list "b" "bbb") (list "cc") (list "d" "dd")))

(define (words-by-first-letter d)
  (words-by-first-letter* LETTERS d))

; List-of-Letter Dictionary -> List-of-Dictionary
; Auxilary function for words-by-letter
(check-expect (words-by-first-letter* LETTERS LITTLE-DICT) lod1)
(check-expect (words-by-first-letter* (list "t" "i" "z") LITTLE-DICT) (list (list "this" "to" "test") (list "is")))

(define (words-by-first-letter* lol d)
  (cond
    [(empty? lol) '()]
    [else (if (equal? (words-by (first lol) d) '())
              (words-by-first-letter* (rest lol) d)
              (cons (words-by (first lol) d) (words-by-first-letter* (rest lol) d)))]))

; Letter Dictionary -> Dictionary
; Produces a Dictionary of the given letter
(check-expect (words-by "z" LITTLE-DICT) '())
(check-expect (words-by "t" LITTLE-DICT) (list "this" "to" "test"))
(check-expect (words-by "i" LITTLE-DICT) (list "is"))
(check-expect (words-by "a" (list "abcd" "abc" "b")) (list "abcd" "abc"))

(define (words-by l d)
  (cond
    [(empty? d) '()]
    [else (if (string=? l (first (explode (first d))))
              (cons (first d) (words-by l (rest d)))
              (words-by l (rest d)))]))


; Dictionary -> Letter-Counts
; Consumes a Dictionary and produces a Letter-Counts for the most frequent one on the Dictionary
(check-expect (most-frequent LITTLE-DICT) (start-withlc "t" LITTLE-DICT))
(check-expect (most-frequent (list "aa" "aa" "aa" "bb" "cc" "bb")) (make-lettercounts "a" 3))

(define (most-frequent d)
  (first (sort-lolc (count-by-letter d))))

; List-of-Letter-Counts -> List-of-Letter-Counts
; Consumes a List-of-Letter-Counts and sort> it
(check-expect (sort-lolc (list (make-lettercounts "a" 8) (make-lettercounts "b" 4) (make-lettercounts "e" 15) (make-lettercounts "z" 0)))
              (list (make-lettercounts "e" 15) (make-lettercounts "a" 8) (make-lettercounts "b" 4) (make-lettercounts "z" 0)))

(define (sort-lolc lolc)
  (cond
    [(empty? lolc) '()]
    [else (sort-lolc* (first lolc) (sort-lolc (rest lolc)))]))

; Letter-Counts List-of-Letter-Counts -> List-of-Letter-Counts
; Auxiliar function for sort-lolc
; Inserts a Letter-Counts on a given sorted> List-of-Letter-Counts
(check-expect (sort-lolc* (make-lettercounts "g" 4) '()) (list (make-lettercounts "g" 4)))
(check-expect (sort-lolc* (make-lettercounts "f" 6) (list (make-lettercounts "a" 10) (make-lettercounts "z" 2)))
              (list (make-lettercounts "a" 10) (make-lettercounts "f" 6) (make-lettercounts "z" 2)))
(check-expect (sort-lolc* (make-lettercounts "f" 1) (list (make-lettercounts "a" 10) (make-lettercounts "z" 2)))
              (list (make-lettercounts "a" 10) (make-lettercounts "z" 2) (make-lettercounts "f" 1)))

(define (sort-lolc* lc lolc)
  (cond
    [(empty? lolc) (cons lc '())]
    [else (if (>= (lettercounts-counts lc) (lettercounts-counts (first lolc)))
              (cons lc lolc)
              (cons (first lolc) (sort-lolc* lc (rest lolc))))]))


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

;; The most frequent first-letter word is "s" with 38761 times.