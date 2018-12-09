;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 173 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; FileName -> File
; a program that reads a given file aren produces a file with aritcles removed
(define (remove-articles-file fn)
  (write-file (string-append "no-articles-" fn)
              (collapse (remove-articles (read-words/line fn)))))


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


; LLS -> LLS
; remove the articles from a List-list-of-strings
(check-expect (remove-articles '()) '())
(check-expect (remove-articles (cons (cons "the" '()) '())) (cons '() '()))
(check-expect (remove-articles (cons (cons "idea" '()) '())) (cons (cons "idea" '()) '()))
(check-expect (remove-articles (cons (cons "the" (cons "girl" '())) (cons (cons "with" (cons "an" (cons "idea" '()))) '())))
              (cons (cons "girl" '()) (cons (cons "with" (cons "idea" '())) '())))

(define (remove-articles lls)
  (cond [(empty? lls) '()]
        (else
         (cons (remove-articles-line (first lls))
               (remove-articles (rest lls))))))

; Los -> Los
; remove 'a' 'an' 'the' from a List-of-strings
(check-expect (remove-articles-line '()) '())
(check-expect (remove-articles-line (cons "a" (cons "man" (cons "and" (cons "an" (cons "idea" '()))))))
              (cons "man" (cons "and" (cons "idea" '()))))

(define (remove-articles-line los)
  (cond [(empty? los) '()]
        [else
         (if (article? (first los))
             (remove-articles-line (rest los))
             (cons (first los)
                   (remove-articles-line (rest los))))]))

; String -> Boolean
; return #true if String is an article
(check-expect (article? "and") #false)
(check-expect (article? "a") #true)
(check-expect (article? "an") #true)
(check-expect (article? "the") #true)

(define (article? s)
  (or (string=? s "a")
      (string=? s "an")
      (string=? s "the")))

; A Los (short for list-of-strings) is one of:
; - '()
; - (cons String Los)
(define los1 '())
(define los2 (cons "black" '()))


; A LLS (short of list-of-lines) is one of:
; - '()
; - (cons Los LLS)
(define lls1 '())
(define lls2 (cons los2 (cons los1 '())))