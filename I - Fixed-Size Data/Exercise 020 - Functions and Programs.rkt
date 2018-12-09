;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise20.stringdeletefunction) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;string delete
(define (string-delete str i)
  (if (= (string-length str) 0)
      str
  (string-append
   (substring str 0 i)
   (substring str (+ i 1)))))

;test
(check-expect (string-delete "abcdefg" 0)
"bcdefg")
(check-expect (string-delete "abcdefg" 4)
"abcdfg")
(check-expect (string-delete "" 3)
"")