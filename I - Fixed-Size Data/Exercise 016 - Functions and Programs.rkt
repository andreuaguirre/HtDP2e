;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise16.imageareafunction) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;image area
(define (image-area x)
  (*(image-width x)(image-height x)))

;test
(check-expect (image-area (rectangle 2 3 "solid" "blue"))6)
(check-expect (image-area (rectangle 1 1 "solid" "blue"))1)
(check-expect (image-area (rectangle 2 0 "solid" "blue"))0)