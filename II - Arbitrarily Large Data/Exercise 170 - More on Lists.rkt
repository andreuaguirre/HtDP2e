;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 170 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-phone -> List-of-phone
; Consumes and produces a list of Phones.
; It replaces all occurrence of area code 713 with 281.
(check-expect (replace '()) '())
(check-expect (replace (cons (make-phone 123 321 2314) (cons (make-phone 713 713 6823) '()))) (cons (make-phone 123 321 2314) (cons (make-phone 281 713 6823) '())))

(define (replace loph)
  (cond
    [(empty? loph) '()]
    [else (cons (replace* (first loph))
                (replace (rest loph)))]))

; Phone -> Phone
; It replaces all occurrence of area code 713 with 281.
(check-expect (replace* (make-phone 713 536 6987)) (make-phone 281 536 6987))
(check-expect (replace* (make-phone 654 456 9874)) (make-phone 654 456 9874))

(define (replace* ph)
  (make-phone (if (equal? (phone-area ph) 713)
                  281
                  (phone-area ph))
              (phone-switch ph) (phone-four ph)))

; A Phone is a structure:
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999.
; A Four is a Number between 1000 and 9999.
(define-struct phone [area switch four])

(define phoneex1 (make-phone 581 397 8162))

; A list-of-phone is one of:
; - '()
; - (cons Phone list-of-phone
(define loph1 '())
(define loph2 (cons (make-phone 123 456 7890) '()))