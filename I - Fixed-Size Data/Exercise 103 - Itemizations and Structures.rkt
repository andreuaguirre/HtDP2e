;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 103 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Spiders is a struct
; -Legs for number of legs ;Number
; -Space for volume ;Number
(define-struct spiders [legs space])
;template
(define (spiders-fn s)
  (... (... (spiders-legs s))
       (... (spiders-space s))))


; Elephants is a struct
; -Space for volume ;Number
(define-struct elephants [space])
;template
(define (elephants-fn e)
  (... (... (elephants-space))))


; Boa constrictor is a struct
; -Length ;Number
; -Girth ;Number
(define-struct boa [length girth])
;template
(define (boaconstrictor-fn b)
  (... (... (boa-length b))
       (... (boa-girth b))))


; Armadillo is a struct
; -Space ;Number
; -Age ;Number
(define-struct armadillo [space age])
;template
(define (armadillo-fn a)
  (... (... (armadillo-space a))
       (... (armadillo-age a))))


; Cage is a struct
; -Space ;Number
(define-struct cage [space])
;template
(define (cage-fn c)
  (... (... (cage-space c))))


; Fits?
; Animal VCage -> Fits?
(check-expect (fits? (make-elephants 2000) (make-cage 1500)) #false)
(check-expect (fits? (make-elephants 2500) (make-cage 3000)) #true)
(check-expect (fits? (make-spiders 8 150) (make-cage 149)) #false)
(check-expect (fits? (make-spiders 7 200) (make-cage 210)) #true)
(check-expect (fits? (make-armadillo 800 10) (make-cage 1000)) #true)
(check-expect (fits? (make-armadillo 900 4) (make-cage 850)) #false)
(check-expect (fits? (make-boa 4 2) (make-cage 1500)) "wrong animal")

(define (fits? animal cage)
  (cond
    [(and (spiders? animal) (<= (spiders-space animal) (cage-space cage))) #true]
    [(and (elephants? animal) (<= (elephants-space animal) (cage-space cage))) #true]
    [(and (armadillo? animal) (<= (armadillo-space animal) (cage-space cage))) #true]
    [(not (or (armadillo? animal) (spiders? animal) (elephants? animal))) "wrong animal"]
    [else #false]))