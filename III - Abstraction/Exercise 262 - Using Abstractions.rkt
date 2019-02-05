;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 262 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Number -> [List-of [List-of Number]]
; Creates diagonal squares of 0s and 1s
(check-expect (identityM 1) (list (list 1)))
(check-expect (identityM 3) (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))
(check-expect (identityM 5) (list (list 1 0 0 0 0) (list 0 1 0 0 0) (list 0 0 1 0 0) (list 0 0 0 1 0) (list 0 0 0 0 1)))

(define (identityM n)
  (local (; Number of columns
          (define col n)

          ; Number -> [List-of [List-of Number]]
          (define (matrix n)
            (cond
              [(zero? n) '()]
              [else (cons (row n col)
                          (matrix (sub1 n)))]))

          ; Number Number -> [List-of Number]
          (define (row n len)
            (cond
              [(zero? len) '()]
              [else (cons (if (= n len) 1 0)
                          (row n (sub1 len)))])))
    (matrix n)))