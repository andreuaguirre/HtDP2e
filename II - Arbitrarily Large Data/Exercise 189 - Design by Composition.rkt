;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 189 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Number Sorted>-List-of-numbers -> Boolean
; Determines whether some number occurs in a list of sorted> numbers.
(check-expect (search-sorted 5 '()) #false)
(check-expect (search-sorted 20 (list 2 7 18 20 25 35)) #true)
(check-expect (search-sorted 5 (list 2 3 4 6 7 8)) #false)
(check-expect (search-sorted 7 (list 12 15 28 351)) #false)

(define (search-sorted n alon)
  (cond
    [(empty? alon) #false]
    [(< n (first alon)) #false]
    [else (or (= (first alon) n)
              (search-sorted n (rest alon)))]))