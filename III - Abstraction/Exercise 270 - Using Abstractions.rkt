;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 270 - Using Abstractions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; N -> [List-of N]
(check-expect (build-list1 7) (list 0 1 2 3 4 5 6))

(define (build-list1 n)
  (local (; N -> N
          (define (helper n)
            n))
    (build-list n helper)))


; N -> [List-of N]
(check-expect (build-list2 7) (list 1 2 3 4 5 6 7))

(define (build-list2 n)
  (local (; N -> N
          (define (helper n)
            (add1 n)))
    (build-list n helper)))


; N -> [List-of N]
(check-expect (build-list3 5) (list 1 1/2 1/3 1/4 1/5))

(define (build-list3 n)
  (local (; N -> N
          (define (helper n)
            (/ 1 (add1 n))))
    (build-list n helper)))


; N -> [List-of N]
(check-expect (build-list4 10) (list 0 2 4 6 8 10))

(define (build-list4 n)
  (local (; N -> N
          (define (helper n)
            (add1 n))

          ; [List-of N] -> [List-of N]
          (define (helper2 l)
            (cond
              [(empty? l) '()]
              [else (if (even? (first l))
                        (cons (first l) (helper2 (rest l)))
                        (helper2 (rest l)))])))
    
    (cons 0 (helper2 (build-list n helper)))))


; N -> [List-of N]
(check-expect (identityM 5) (list (list 1 0 0 0 0) (list 0 1 0 0 0) (list 0 0 1 0 0) (list 0 0 0 1 0) (list 0 0 0 0 1)))

(define (identityM n)
  (local (; the length of columns
          (define cols n)

          ; N -> [List-of N]
          (define (generate-row n)
            (generate-row-helper n 0))

          ; N N -> [List-of N]
          (define (generate-row-helper n i)
            (cond
              [(= i cols) '()]
              [else (cons (if (= n i) 1 0)
                          (generate-row-helper n (add1 i)))])))
    (build-list n generate-row)))



; N [N -> N] -> [List-of N]
(check-expect (tabulate sqr 6) (list 0 1 4 9 16 25 36))

(define (tabulate f n)
  (append (build-list n f) (list (f n))))



; N [N -> X] -> [List-of X]
; constructs a list by applying f to 0, 1, ..., (sub1 n)
; (build-list n f) == (list (f 0) ... (f (- n 1)))
;(define (build-list n f) ...)