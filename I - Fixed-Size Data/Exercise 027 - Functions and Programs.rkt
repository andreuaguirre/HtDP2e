;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise27.magicnumbers) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;constants
(define averageattendees 120)
(define averageticket-price 5.0)
(define attendancechange 15)
(define ticket-pricechange 0.1)
(define fixedcost 180)
(define costattendee 0.04)

;functions
(define (attendees ticket-price)
  (- averageattendees (* (- ticket-price averageticket-price) (/ attendancechange ticket-pricechange))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixedcost (* costattendee (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;test
(check-expect (attendees 5) 120)
(check-expect (revenue 5) 600)
(check-expect (cost 5) 184.8)
(check-expect (profit 5) 415.2)