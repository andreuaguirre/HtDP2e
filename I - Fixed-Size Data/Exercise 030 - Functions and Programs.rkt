;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise30.pricesensitivity) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;constants
(define AVERAGEATTENDEES 120)
(define AVERAGETICKET-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define TICKET-PRICECHANGE 0.1)
(define COST-ATTENDEE 1.5)
(define PRICE-SENSITIVITY (/ ATTENDANCE-CHANGE TICKET-PRICECHANGE))

;functions
(define (attendees ticket-price)
  (- AVERAGEATTENDEES
     (* (- ticket-price AVERAGETICKET-PRICE) PRICE-SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* COST-ATTENDEE (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;max profit 3.6
(check-expect (profit 3.6) 693)