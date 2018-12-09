;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 179 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S)

; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)
(define lo1s1 '())
(define lo1s2 (cons "a" (cons "b" (cons "c" '()))))


; Editor -> Editor
; moves the cursor position one 1String left,
; if possible
(check-expect (editor-lft (create-editor "" "")) (create-editor "" ""))
(check-expect (editor-lft (create-editor "" "asd")) (create-editor "" "asd"))
(check-expect (editor-lft (create-editor "a" "")) (create-editor "" "a"))
(check-expect (editor-lft (create-editor "abc" "def")) (create-editor "ab" "cdef"))

(define (editor-lft ed)
  (cond
    [(empty? (editor-pre ed)) ed]
    [else (make-editor (rest (editor-pre ed))
                  (cons (first (editor-pre ed))
                        (editor-post ed)))]))

; Editor -> Editor
; moves the cursor position one 1String right,
; if possible
(check-expect (editor-rgt (create-editor "cde" "")) (create-editor "cde" ""))
(check-expect (editor-rgt (create-editor "cd" "fgh")) (create-editor "cdf" "gh"))

(define (editor-rgt ed)
  (cond [(empty? (editor-post ed)) ed]
        [else
         (make-editor (cons (first (editor-post ed))
                            (editor-pre ed))
                      (rest (editor-post ed)))]))

; Editor -> Editor
; deletes a 1String to the left of the cursor,
; if possible
(check-expect (editor-del (create-editor "" "fgh")) (create-editor "" "fgh"))
(check-expect (editor-del (create-editor "cd" "fgh")) (create-editor "c" "fgh"))

(define (editor-del ed)
  (cond
    [(empty? (editor-pre ed)) ed]
    [else (make-editor (rest (editor-pre ed))
                       (editor-post ed))]))




; String String -> Editor
; The first string is the text to the left of the cursor
; and the second string is the text to the right of the cursor.
(check-expect (create-editor "hello" "world") (make-editor (cons "o" (cons "l" (cons "l" (cons "e" (cons "h" '()))))) (cons "w" (cons "o" (cons "r" (cons "l" (cons "d" '())))))))

(define (create-editor s1 s2)
  (make-editor (rev (explode s1)) (explode s2)))


; Lo1s -> Lo1s
; produces a reverse version of the given list
(check-expect
 (rev (cons "a" (cons "b" (cons "c" '()))))
 (cons "c" (cons "b" (cons "a" '()))))

(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))


; Lo1s 1String -> Lo1s
; creates a new list by adding s to the end of l
(check-expect (add-at-end '() "z") (cons "z" '()))
(check-expect (add-at-end (cons "c" (cons "b" '())) "a") (cons "c" (cons "b" (cons "a" '()))))

(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else (cons (first l) (add-at-end (rest l) s))]))