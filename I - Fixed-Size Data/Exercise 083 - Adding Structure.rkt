;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 83 - Adding Structure|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; physical constants
(define MSN (empty-scene 200 20))
(define cursor (rectangle 1 20 "solid" "red"))

; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
(define-struct editor [pre post])

; render -> image
; (render editor)
; (render (make-editor String String))
(check-expect (render (make-editor "abc" "def"))
              (overlay/align "left" "center" (beside (text "abc" 16 "black") cursor (text "def" 16 "black")) MSN))
              
(define (render ed)
  (overlay/align "left" "center"
   (beside
    (text (editor-pre (make-editor (editor-pre ed) (editor-post ed))) 16 "black")
    cursor
    (text (editor-post (make-editor (editor-pre ed) (editor-post ed))) 16 "black"))
   MSN))