;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 235 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Los -> Boolean
; Determines whether l contains the string "atom"
(check-expect (contains-atom? '("abcd" "efgh" "ijkl")) #false)
(check-expect (contains-atom? '("abcd" "atom" "efgh")) #true)

(define (contains-atom? l)
  (contains? "atom" l))

; Los -> Boolean
; Determines whether l contains the string "basic"
(check-expect (contains-basic? '("abcd" "efgh" "ijkl")) #false)
(check-expect (contains-basic? '("abcd" "basic" "efgh")) #true)

(define (contains-basic? l)
  (contains? "basic" l))

; Los -> Boolean
; Determines whether l contains the string "zoo"
(check-expect (contains-zoo? '("abcd" "efgh" "ijkl")) #false)
(check-expect (contains-zoo? '("abcd" "zoo" "efgh")) #true)

(define (contains-zoo? l)
  (contains? "zoo" l))

; String Los -> Boolean
; Determines whether l contains the string s
(define (contains? s l)
  (cond
    [(empty? l) #false]
    [else (or (string=? (first l) s)
              (contains? s (rest l)))]))