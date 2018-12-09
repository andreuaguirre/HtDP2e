;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 175 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; wc-results is a (make-results Number Number Number)
; interpretation: a result is a count of lines, a count of words and
;                 a count of letters.
(define-struct results [lines words letters])

(define RESULT0 (make-results 0 0 0)) ; no resutls

#; ; template
(define (fun-for-results res)
  (... (results-lines res)
       (results-words res)
       (results-letters res)))


; LLS -> WC-Results
(check-expect (wc '()) (make-results 0 0 0))
(check-expect (wc (cons (cons "aaa" (cons "bb" '()))
                        (cons (cons "cccc" '())
                        '())))
              (make-results 2 3 9))

(define (wc lls)
  (make-results (length lls)
                (count-words lls)
                (count-chars lls)))

; LLS -> Number
; count the words in a List-of-list-string (text)
(check-expect (count-words '()) 0)
(check-expect (count-words (cons (cons "aaa" (cons "bb" '()))
                                 (cons (cons "cccc" '())
                                       '())))
              3)

(define (count-words lls)
  (cond [(empty? lls) 0]
        [else
         (+ (length (first lls))
            (count-words (rest lls)))]))

; LLS -> Number
; count the number of 1String (char) in a List-of-list-string (text)
(check-expect (count-chars '()) 0)
(check-expect (count-chars (cons (cons "aaa" (cons "bb" '()))
                                 (cons (cons "cccc" '())
                                       '())))
              9)

(define (count-chars lls)
  (cond ([empty? lls] 0)
        [else
         (+ (chars-line (first lls))
            (count-chars (rest lls)))]))

; LOS -> Number
; count the number of 1String (char) in a List-of-string (line of text)
(check-expect (chars-line '()) 0)
(check-expect (chars-line (cons "aaa" (cons "bb" '()))) 5)

(define (chars-line los)
  (cond ([empty? los] 0)
        [else
         (+ (string-length (first los))
            (chars-line (rest los)))]))