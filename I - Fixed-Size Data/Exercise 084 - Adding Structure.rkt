;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 84 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t


; String -> String
; removes the last character of a string str
; if it has no characters, stays the same
; given: "abcde" expect: "abcd"
(check-expect (string-remove-last "abcde") "abcd")
(check-expect (string-remove-last "a") "")
(check-expect (string-remove-last "") "")

(define (string-remove-last str)
  (if
   (>= (string-length str) 1)
   (substring str 0 (- (string-length str) 1))
   str))


; String -> String
; extracts the first character from a string
; given: "abcd", expect: "a"
; if there's no characters, stays the same
(check-expect (string-first "abc") "a")
(check-expect (string-first "a") "a")
(check-expect (string-first "") "")

(define (string-first str)
  (if
   (>= (string-length str) 1)
   (substring str 0 1)
   str))


; String -> String
; removes the first character of a string str
; given: "abcde" expect: "bcde"
; if there's no characters, stays the same
(check-expect (string-rest "abc") "bc")
(check-expect (string-rest "a") "")
(check-expect (string-rest "") "")

(define (string-rest str)
  (if
   (>= (string-length str) 1)
   (substring str 1)
   str))


; String -> String
; extracts de last character of a string str
; given: "abcd" expected: "d"
; if there's no characters, stays the same
(check-expect (string-last "abcd") "d")
(check-expect (string-last "a") "a")
(check-expect (string-last "") "")

(define (string-last str)
  (if
   (>= (string-length str) 1)
   (substring str (- (string-length str) 1)
                   (string-length str))
   str))


; String + String -> String
; appends the KeyEvent string to a given string
(check-expect (addstring "abcdef" "z") "abcdefz")

(define (addstring string ke)
  (string-append string ke))



; Editor + KeyEvent -> Editor
; write, move or delete characters depending on the KeyEvent
(check-expect (edit (make-editor "abc" "def") "left")
              (make-editor "ab" "cdef"))
(check-expect (edit (make-editor "" "def") "left")
              (make-editor "" "def"))
(check-expect (edit (make-editor "abc" "def") "right")
              (make-editor "abcd" "ef"))
(check-expect (edit (make-editor "abc" "") "right")
              (make-editor "abc" ""))
(check-expect (edit (make-editor "abc" "def") "\b")
              (make-editor "ab" "def"))
(check-expect (edit (make-editor "" "def") "\b")
              (make-editor "" "def"))
(check-expect (edit (make-editor "abc" "def") "\t")
              (make-editor "abc" "def"))
(check-expect (edit (make-editor "abc" "def") "\r")
              (make-editor "abc" "def"))
(check-expect (edit (make-editor "abc" "def") "a")
              (make-editor "abca" "def"))

(define (edit ed ke)
  (cond
    [(string=? "left" ke) (make-editor (string-remove-last (editor-pre ed))
                                       (string-append (string-last (editor-pre ed)) (editor-post ed)))]
    [(string=? "right" ke) (make-editor (string-append (editor-pre ed) (string-first (editor-post ed)))
                                        (string-rest (editor-post ed)))]
    [(string=? "\b" ke) (make-editor (string-remove-last (editor-pre ed))
                                     (editor-post ed))]
    [(string=? "\t" ke) ed]
    [(string=? "\r" ke) ed]
    [(= (string-length ke) 1) (make-editor (addstring (editor-pre ed) ke)
                                           (editor-post ed))]))