;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 271 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; String [List-of String] -> Boolean
; Determines whether any of the names on the latter are equal to or an extension of the former.
(check-expect (find-name "a" (list "a" "b" "c")) #true)
(check-expect (find-name "a" (list "b" "c" "d")) #false)
(check-expect (find-name "abcde" (list "abcdefghijk")) #true)
(check-expect (find-name "abcde" (list "abcd")) #false)

(define (find-name name l)
  (local (; Name length
          (define len
            (string-length name))

          ; String -> Boolean
          (define (helper s)
            (cond
              [(> (string-length s) len) (string=? name (substring s 0 len))]
              [(= (string-length s) len) (string=? name s)]
              [else #false])))
          
    (ormap helper l)))


; [List-of String] -> Boolean
; Determine if all the strings on the List starts with the letter "a".
(check-expect (starts-with-a? (list "abcd" "asdf")) #true)
(check-expect (starts-with-a? (list "abcd" "efgh")) #false)

(define (starts-with-a? l)
  (local (; String -> Boolean
          (define (helper s)
            (string=? "a" (substring s 0 1))))

    (andmap helper l)))



; Should you use ormap or andmap to define a function that ensures that no name on some list exceeds a given width?

;; You should use ormap, so if some name exceeds the given witdh, the function returns (not #true) == #false.


; N [List-of String] -> Boolean
; Ensures that no String on the given List exceeds a given width (Number).
; Returns #false if any String is too large.
(check-expect (not-too-large? 5 (list "a" "ab" "abc" "abcd")) #true)
(check-expect (not-too-large? 3 (list "a" "ab" "abc")) #true)
(check-expect (not-too-large? 2 (list "a" "ab" "abc")) #false)

(define (not-too-large? n l)
  (local (; String -> Boolean
          (define (helper s)
            (> (string-length s) n)))

    (not (ormap helper l))))