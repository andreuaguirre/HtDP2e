;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise5.boat) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;boat scale
(define boat.scale 3)

;boat parts
(define hull (underlay/xy (circle (* boat.scale 20) "solid" "brown")
           0 0 (rectangle (* boat.scale 40) (* boat.scale 30) "solid" "white")))
(define mast (rectangle (* boat.scale 4) (* boat.scale 20) "solid" "brown"))
(define mainsail (right-triangle (* boat.scale 10) (* boat.scale 15) "solid" "gray"))
(define mast.hull (place-image mast (* boat.scale 20) (* boat.scale 20) hull))
(define boat (place-image mainsail (* boat.scale 27) (* boat.scale 17.4) mast.hull))

boat