;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 104 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Vehicles can be one of
; - Automobiles
; - Vans
; - Buses
; - SUVs

; Automobile is a struct
(define-struct automobile [passengers plate fuel])
;template
(define (automobile-fn a)
  (... (... (automobile-passengers a))
       (... (automobile-plate a))
       (... (automobile-fuel a))))

; Van is a struct
(define-struct van [passengers plate fuel])
;template
(define (van-fn v)
  (... (... (van-passengers v))
       (... (van-plate v))
       (... (van-fuel v))))

; Bus is a struct
(define-struct bus [passengers plate fuel])
;template
(define (bus-fn b)
  (... (... (bus-passengers b))
       (... (bus-plate b))
       (... (bus-fuel b))))

; SUV is a struct
(define-struct suv [passengers plate fuel])
;template
(define (suv-fn s)
  (... (... (suv-passengers v))
       (... (suv-plate v))
       (... (suv-fuel v))))

; passengers is a Number
; interp: number of passenger the vehicle can carry

; plate is a Number
; interp: license plate number

; fuel is a Number
; interp: fuel consumption of the vehicle in miles/gallon