;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 121 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 121. Evaluate the following expressions step-by-step:

(+ (* (/ 12 8) 2/3)
   (- 20 (sqrt 4)))

(cond
  [(= 0 0) #false]
  [(> 0 1) (string=? "a" "a")]
  [else (= (/  1 0) 9)])

(cond
  [(= 2 0) #false]
  [(> 2 1) (string=? "a" "a")]
  [else (= (/  1 2) 9)])


; Use DrRacket’s stepper to confirm your computations.