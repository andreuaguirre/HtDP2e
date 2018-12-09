;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 183 - Design by Composition|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 183. On some occasions lists are formed with cons and list.

; 1. (cons "a" (list 0 #false))
(check-expect (cons "a" (cons 0 (cons #false '())))
              (cons "a" (list 0 #false)))

(check-expect (list "a" 0 #false)
              (cons "a" (list 0 #false)))


; 2. (list (cons 1 (cons 13 '())))
(check-expect (cons (cons 1 (cons 13 '())) '())
              (list (cons 1 (cons 13 '()))))

(check-expect (list (list 1 13))
              (list (cons 1 (cons 13 '()))))


; 3. (cons (list 1 (list 13 '())) '())
(check-expect (cons (cons 1 (cons (cons 13 (cons '() '())) '())) '())
              (cons (list 1 (list 13 '())) '()))

(check-expect (list (list 1 (list 13 '())))
              (cons (list 1 (list 13 '())) '()))


; 4. (list '() '() (cons 1 '()))
(check-expect (cons '() (cons '() (cons (cons 1 '()) '())))
              (list '() '() (cons 1 '())))

(check-expect (list '() '() (list 1))
              (list '() '() (cons 1 '())))


; 5. (cons "a" (cons (list 1) (list #false '())))
(check-expect (cons "a" (cons (cons 1 '()) (cons #false (cons '() '())) ))
              (cons "a" (cons (list 1) (list #false '()))))

(check-expect (list "a" (list 1) #false '())
              (cons "a" (cons (list 1) (list #false '()))))


; Reformulate each of the following expressions using only cons or only list. Use check-expect to check your answers. 