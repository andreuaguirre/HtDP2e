;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise17.widetallsquarefunction) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;image classify (wide-tall-square)
(define (image-classify x)
  (if (> (image-width x)(image-height x))
      "wide"
     (if (= (image-width x)(image-height x))
         "square"
         "tall")))

;test
(check-expect (image-classify (rectangle 50 40 "solid" "blue"))
"wide")
(check-expect (image-classify (rectangle 30 40 "solid" "blue"))
"tall")
(check-expect (image-classify (rectangle 40 40 "solid" "blue"))
"square")