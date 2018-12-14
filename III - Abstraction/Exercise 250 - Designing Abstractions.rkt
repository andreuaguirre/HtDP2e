;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 250 - Similarities Everywhere|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [Number -> Number] Number -> [List-of Number]
(check-within (tabulate sin 5) (tab-sin 5) 0.000001)
(check-within (tabulate sqrt 5) (tab-sqrt 5) 0.000001)

(define (tabulate g n)
  (cond
    [(= n 0) (list (g 0))]
    [else
     (cons
      (g n)
      (tabulate g (sub1 n)))]))


; Number -> [List-of Number]
; tabulates sqr between n
; and 0 (incl.) in a list
(check-expect (tab-sqr 3) (list 9 4 1 0))

(define (tab-sqr n)
  (tabulate sqr n))

; Number -> [List-of Number]
; tabulates tan between n
; and 0 (incl.) in a list
(check-within (tab-tan 3) (list (tan 3) (tan 2) (tan 1) (tan 0)) 0.000001)

(define (tab-tan n)
  (tabulate tan n))



; Number -> [List-of Number]
; tabulates sin between n
; and 0 (incl.) in a list
(define (tab-sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
     (cons
      (sin n)
      (tab-sin (sub1 n)))]))

; Number -> [List-of Number]
; tabulates sqrt between n
; and 0 (incl.) in a list
(define (tab-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (sqrt n)
      (tab-sqrt (sub1 n)))]))