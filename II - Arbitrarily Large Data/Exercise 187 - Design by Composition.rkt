;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 187 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A GamePlayer is a structure:
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who
; scored a maximum of s points
(define-struct gp [name score])

; List-of-GamePlayer is one of:
; '()
; (cons GamePlayer List-of-GamePlayer)


; List-of-GamePlayer -> List-of-GamePlayer
; Sorts a log in descending order of score
(check-expect (sortlog> '()) '())
(check-expect (sortlog> (list (make-gp "Sam" 52))) (list (make-gp "Sam" 52)))
(check-expect (sortlog> (list (make-gp "Sam" 52) (make-gp "Pau" 99) (make-gp "Andreu" 12))) (list (make-gp "Pau" 99) (make-gp "Sam" 52) (make-gp "Andreu" 12)))

(define (sortlog> log)
  (cond
    [(empty? log) '()]
    [(cons? log) (sortscore (first log) (sortlog> (rest log)))]))

; GamePlayer Log -> List-of-GamePlayer
; Inserts a GamePlayer into a sorted> Log
(check-expect (sortscore (make-gp "Sam" 5) '()) (list (make-gp "Sam" 5)))
(check-expect (sortscore (make-gp "Sam" 23) (list (make-gp "Andreu" 50))) (list (make-gp "Andreu" 50) (make-gp "Sam" 23)))
(check-expect (sortscore (make-gp "Sam" 40) (list (make-gp "Andreu" 50) (make-gp "Pau" 10))) (list (make-gp "Andreu" 50) (make-gp "Sam" 40) (make-gp "Pau" 10)))

(define (sortscore gp log)
  (cond
    [(empty? log) (cons gp '())]
    [else (if (>= (gp-score gp) (gp-score (first log)))
              (cons gp log)
              (cons (first log) (sortscore gp (rest log))))]))