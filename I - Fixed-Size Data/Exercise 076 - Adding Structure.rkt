;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 76 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; movie is a structure
; (make-movie String String Number)
; interpretation: title is the name of the movie
;                 producer is the name of the producer
;                 year is the year it was made
(define-struct movie [title producer year])


; person is a structure
; (make-person String String String Number)
; interpretation: name is the name of the person
;                 hair is the hair color
;                 eyes is the eyes color
;                 phone is the phone number
(define-struct person [name hair eyes phone])


; pet is a structure
; (make-pet String Number)
; interpretation: pet name and number plate
(define-struct pet [name number])


; CD is a structure
; (make-CD String String Number
; interpretation: artist name, title of the CD, CD price
(define-struct CD [artist title price])


; sweater is a structure
; (make-sweater String Number String
; interpretation: material craft, size number, producer brand
(define-struct sweater [material size producer])