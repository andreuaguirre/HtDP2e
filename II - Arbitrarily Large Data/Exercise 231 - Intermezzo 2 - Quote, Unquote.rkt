;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 231 - Intermezzo 2 - Quote, Unquote|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 231. Eliminate quote in favor of list from these expressions:

(check-expect '(1 "a" 2 #false 3 "c")
              (list 1 "a" 2 #false 3 "c"))


(check-expect '()
              '())


; And this table-like shape:

(check-expect '(("alan" 1000)
                ("barb" 2000)
                ("carl" 1500))
              (list (list "alan" 1000)
                    (list "barb" 2000)
                    (list "carl" 1500)))


; Now eliminate list in favor of cons where needed.

(check-expect (list 1 "a" 2 #false 3 "c")
              (cons 1 (cons "a" (cons 2 (cons #false (cons 3 (cons "c" '())))))))

(check-expect (list (list "allan" 1000)
                    (list "barb" 2000)
                    (list "carl" 1500))
              (cons (cons "allan" (cons 1000 '()))
                    (cons (cons "barb" (cons 2000 '()))
                          (cons (cons "carl" (cons 1500 '())) '()))))