;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 186 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-numbers -> List-of-numbers
; produces a sorted descending version of l
(check-expect (sort> '()) '())
(check-satisfied (sort> (list 2)) sorted>?)
(check-satisfied (sort> (list 5 10 2 1 9 4 22 3)) sorted>?)

(define (sort> l)
  (cond
    [(empty? l) '()]
    [(cons? l) (insert (first l) (sort> (rest l)))]))

; Number List-of-numbers -> List-of-numbers
; inserts n into the sorted list of numbers l
(check-expect (insert 4 '()) (list 4))
(check-expect (insert 5 (list 4 2 1)) (list 5 4 2 1))
(check-expect (insert 2 (list 10 6 4)) (list 10 6 4 2))
(check-expect (insert 8 (list 10 9 7 5 1)) (list 10 9 8 7 5 1))

(define (insert n l)
  (cond
    [(empty? l) (cons n '())]
    [else (if (>= n (first l))
              (cons n l)
              (cons (first l) (insert n (rest l))))]))


; NEList-of-numbers -> Boolean
; If the numbers are sorted in descending order, #true
; If not, #false
(check-expect (sorted>? (cons 5 '())) #true)
(check-expect (sorted>? (cons 10 (cons 6 (cons 2 '())))) #true)
(check-expect (sorted>? (cons 3 (cons 10 '()))) #false)

(define (sorted>? l)
  (cond
    [(empty? (rest l)) #true]
    [else (and (> (first l) (first (rest l)))
               (sorted>? (rest l)))]))