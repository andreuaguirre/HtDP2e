;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 211 - Projects_Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
; Dictionary location
(define DICTIONARY-LOCATION "dictionary.txt")

; A Dictionary is a List-of-strings.
(define DICTIONARY-AS-LIST (read-lines DICTIONARY-LOCATION))

; List-of-strings -> List-of-strings
; pick out all those Strings that occur in the dictionary
(check-expect (in-dictionary '()) '())
(check-expect (in-dictionary (list "apple")) (list "apple"))
(check-expect (in-dictionary (list "asdfg")) '())
(check-expect (in-dictionary (list "apple" "grape")) (list "apple" "grape"))
(check-expect (in-dictionary (list "apple" "asdfg" "grape")) (list "apple" "grape"))

(define (in-dictionary los)
  (cond
    [(empty? los) '()]
    [else (if (string-in-los? (first los) DICTIONARY-AS-LIST)
              (cons (first los) (in-dictionary (rest los)))
              (in-dictionary (rest los)))]))

; String List-of-Strings -> Boolean
; Search a String inside a Los and returns a Boolean
(check-expect (string-in-los? "cat" '()) #false)
(check-expect (string-in-los? "a" (list "q" "w" "e" "r" "t" "y")) #false)
(check-expect (string-in-los? "rat" (list "dog" "rat" "cat")) #true)
(check-expect (string-in-los? "apple" DICTIONARY-AS-LIST) #true)

(define (string-in-los? s los)
  (cond
    [(empty? los) #false]
    [(string=? s (first los)) #true]
    [else (string-in-los? s (rest los))]))

; String -> Word
; converts s to the chosen word representation
(check-expect (string->word "") '())
(check-expect (string->word "cat") (list "c" "a" "t"))

(define (string->word s)
  (explode s))

; List-of-Words -> List-of-Strings
; turns all Words in low into Strings
(check-expect (words->strings '()) '())
(check-expect (words->strings (list (list "abcd"))) (list "abcd"))
(check-expect (words->strings (list (list "c" "a" "t") (list "r" "a" "t"))) (list "cat" "rat"))

(define (words->strings low)
  (cond
    [(empty? low) '()]
    [else (cons (word->string (first low)) (words->strings (rest low)))]))

; Word -> String
; converts w to a string
(check-expect (word->string '()) "")
(check-expect (word->string (list "c" "a" "t")) "cat")

(define (word->string w)
  (cond
    [(empty? w) ""]
    [else (string-append (first w) (word->string (rest w)))]))


; A List-of-Words is one of:
; - '()
; - (cons Word List-of-Words)
(define LOW1 '())
(define LOW2 (list (list "a" "b" "c") (list "r" "a" "t")))

; A Word is one of:
; – '() or
; – (cons 1String Word)
; interpretation a Word is a list of 1Strings (letters)
(define WORD1 '())
(define WORD2 (cons "c" (cons "a" (cons "t" '()))))
(define WORD3 (list "r" "a" "t"))