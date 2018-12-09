;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 66 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
(make-movie "Christopher Robin" "Brigham Taylor and Kristin Burr" 2018)
;title: String
;producer: String
;year: PositiveNumber


(define-struct person [name hair eyes phone])
(make-person "Andreu" "Brown" "Brown" "+34 612345678")
;name: String
;hair: String
;eyes: String
;phone: String


(define-struct pet [name number])
(make-pet "Gos" 351689)
;name: String
;number: PositiveNumber


(define-struct CD [artist title price])
(make-CD "XXXTentacion" "?" 20)
;artist: String
;title: String
;price: PositiveNumber


(define-struct sweater [material size producer])
(make-sweater "Cotton" 44 "Nike")
;material: String
;size: PositiveNumber
;producer: String