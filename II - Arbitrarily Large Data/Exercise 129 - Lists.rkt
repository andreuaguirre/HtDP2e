;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 129 - Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 129. Create BSL lists that represent

; 1. A list of celestial bodies, say, at least all the planets in our solar system.
(cons "Mercury"
      (cons "Venus"
            (cons "Earth"
                  (cons "Mars"
                        (cons "Jupiter"
                              (cons "Saturn"
                                    (cons "Uranus"
                                          (cons "Neptune" '() ))))))))

; 2. A list of items for a meal, for example, steak, french fries,
; beans, bread, water, Brie cheese, and ice cream.
(cons "steak"
      (cons "french fries"
            (cons "beans"
                  (cons "bread"
                        (cons "water"
                              (cons "brie cheese"
                                    (cons "ice cream" '() )))))))

; 3. A list of colors.
(cons "white"
      (cons "green"
            (cons "blue"
                  (cons "red"
                        (cons "black" '() )))))

; Sketch some box representations of these lists, similar to those in figures 44 and 45.
; Which of the sketches do you like better?