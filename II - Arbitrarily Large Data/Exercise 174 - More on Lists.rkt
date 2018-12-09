;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 174 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; FileName -> File
; a program that reads a given file aren produces a file with aritcles removed
(check-expect (encode-file "ttt.txt") (write-file (string-append "encoded-" "ttt.txt") (collapse (encode-lines (read-words/line "ttt.txt")))))

(define (encode-file fn)
  (write-file (string-append "encoded-" fn)
              (collapse (encode-lines (read-words/line fn)))))


; LLS -> LLS
; encode a List-of-list-of-strings line by line
(check-expect (encode-lines '()) '())
(check-expect (encode-lines (cons (cons "aa" '()) '())) (cons (cons "097097" '()) '()))

(define (encode-lines lls)
  (cond [(empty? lls) '()]
        [else
         (cons (encode-line (first lls))
               (encode-lines (rest lls)))]))

; Los -> Los
; encode a List-of-strings
(check-expect (encode-line '()) '())
(check-expect (encode-line (cons "aa" (cons "bb" '()))) (cons "097097" (cons "098098" '())))

(define (encode-line los)
  (cond [(empty? los) '()]
        [else
         (cons (encode-word (explode (first los)))
               (encode-line (rest los)))]))

; List-of-1String -> String
; encodes a String into 3 char ascii representation
(check-expect (encode-word '()) "")
(check-expect (encode-word (cons "a" (cons "b" '()))) "097098")

(define (encode-word los)
  (cond [(empty? los) ""]
        [else
         (string-append (encode-letter (first los))
                        (encode-word (rest los)))]))

; 1String -> String
; converts the given 1String to a 3-letter numeric String
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t") (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a") (string-append "0" (code1 "a")))

(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))

; 1String -> String
; converts the given 1String into a String
(check-expect (code1 "z") "122")

(define (code1 c)
  (number->string (string->int c)))


; LLS -> String
; Converts a list of lines into a string.
; The strings are separated by blank spaces (" ").
; The lines are separated with a newline ("\n").
(check-expect (collapse '()) "")
(check-expect (collapse (cons (cons "First line" '()) (cons (cons "Second line" '()) (cons (cons "Third line" '()) '())))) "First line\nSecond line\nThird line")

(define (collapse lls)
  (cond [(empty? lls) ""]
        [else
         (if (= (length (rest lls)) 0)
             (append-strings (first lls))
             (string-append  (append-strings (first lls)) "\n"
                             (collapse (rest lls))))]))

; Los -> String
; Appends all the strings in a list-of-strings
(check-expect (append-strings '()) "")
(check-expect (append-strings (cons "ab" '())) "ab")
(check-expect (append-strings (cons "abc" (cons "def" (cons "ghi" '())))) "abc def ghi")

(define (append-strings los)
  (cond [(empty? los) ""]
        [else
         (if (= (length (rest los)) 0) (first los)
             (string-append (first los) " "
                            (append-strings (rest los))))]))


; A Los (short for list-of-strings) is one of:
; - '()
; - (cons String Los)
(define los1 '())
(define los2 (cons "black" '()))

; A Lo1s (short for list-of-1String) is one of:
; - '()
; - (cons 1String Lo1s)
(define lo1s1 '())
(define lo1s2 (cons "b" '()))

; A LLS (short of list-of-lines) is one of:
; - '()
; - (cons Los LLS)
(define lls1 '())
(define lls2 (cons los2 (cons los1 '())))