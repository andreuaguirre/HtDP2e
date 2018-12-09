;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 113 - Itemizations and Structures|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A Coordinate is one of:
; – a NegativeNumber 
; interpretation on the y axis, distance from top
; – a PositiveNumber 
; interpretation on the x axis, distance from left
; – a Posn
; interpretation an ordinary Cartesian point

; Coordinate? predicate
; determines if a given data is a Coordinate
(check-expect (coordinate? 2) #true)
(check-expect (coordinate? -4) #true)
(check-expect (coordinate? (make-posn 10 20)) #true)
(check-expect (coordinate? "hello world") #false)
(check-expect (coordinate? (rectangle 2 3 "solid" "blue")) #false)

(define (coordinate? c)
  (cond
    [(or (number? c) (posn? c)) #true]
    [else #false]))

;_____________________________________________________________________________________________;

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

; aim is a struct
; -ufo is a posn
; -tank is a struct
(define-struct aim [ufo tank])

; fired is a struct
; -ufo is a posn
; -tank is a struct
; -missile is a posn
(define-struct fired [ufo tank missile])

;tank is a struct
; -xcoord is a number
; -vel is a number
(define-struct tank [xcoord vel])



; SIGS? predicate
; determines if a given data is a SIGS
(check-expect (sigs? (make-aim (make-posn 2 3) (make-tank 1 2))) #true)
(check-expect (sigs? (make-fired (make-posn 4 2) (make-tank 4 5) (make-posn 3 1))) #true)
(check-expect (sigs? (make-fired (make-posn "asd" 2) (make-tank 4 2) (make-posn 1 2))) #false)
(check-expect (sigs? (make-fired (make-posn 1 " ") (make-tank 6 2) (make-posn 1 2))) #false)
(check-expect (sigs? (make-aim (make-posn 1 3) (make-tank "q" 2))) #false)
(check-expect (sigs? (make-aim (make-posn 1 4) 3)) #false)
(check-expect (sigs? (make-aim (make-posn 1 4) (make-posn "q" 2))) #false)
(check-expect (sigs? (make-aim 2 (make-tank 4 5))) #false)
(check-expect (sigs? (make-posn 2 1)) #false)
(check-expect (sigs? "hello world") #false)

(define (sigs? s)
  (cond
    [(aim? s) (and (posn? (aim-ufo s)) (number? (posn-x (aim-ufo s))) (number? (posn-y (aim-ufo s))) (tank? (aim-tank s)) (number? (tank-xcoord (aim-tank s))) (number? (tank-vel (aim-tank s))))]
    [(fired? s) (and (posn? (fired-ufo s)) (number? (posn-x (fired-ufo s))) (number? (posn-y (fired-ufo s))) (tank? (fired-tank s)) (number? (tank-xcoord (fired-tank s))) (number? (tank-vel (fired-tank s))) (posn? (fired-missile s)) (number? (posn-x (fired-missile s))) (number? (posn-y (fired-missile s))))]
    [else #false]))


;_____________________________________________________________________________________________;

; A VAnimal is either
; – a VCat
; – a VCham

; VCat is a structure
; (make-vcat (xcoord happiness))
; - xcoord is a Number
; interp: location of the cat
; - happiness is a Number
; interp: shows the happiness of the cat thanks to the happiness meter
(define-struct vcat [xcoord happiness])


; VCham is a structure
; (make-vcham (xcoord happiness color))
; - xcoord is a Number
; interp: location of the cham
; - happiness is a Number
; interp: shows the happiness of the cham thanks to the happiness meter
; -color is a String
; interp: color of the cham
(define-struct vcham [xcoord happiness color])


; VAnimal? predicate
; determines if a given data is a VAnimal
(check-expect (vanimal? (make-vcat 2 3)) #true)
(check-expect (vanimal? (make-vcham 0 5 "orange")) #true)
(check-expect (vanimal? (make-vcat "asd" 3)) #false)
(check-expect (vanimal? (make-vcat 4 (make-posn 2 3))) #false)
(check-expect (vanimal? "hello world") #false)
(check-expect (vanimal? (make-vcham "asd" 3 "black")) #false)
(check-expect (vanimal? (make-vcham 1 3 4)) #false)
(check-expect (vanimal? (make-vcham 1 "qw" 2)) #false)

(define (vanimal? v)
  (cond
    [(vcat? v) (and (number? (vcat-xcoord v)) (number? (vcat-happiness v)))]
    [(vcham? v) (and (number? (vcham-xcoord v)) (number? (vcham-happiness v)) (string? (vcham-color v)))]
    [else #false]))