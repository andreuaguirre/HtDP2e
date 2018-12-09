;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 120 - Intermezzo 1 - Beginning Student Language|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 120. Discriminate the legal from the illegal sentences:

;1. (x)

;2. (+ 1 (not x))

;3. (+ 1 2 3)

; Explain why the sentences are legal or illegal.
; Determine whether the legal ones belong to the category expr or def.



;; 1. It's illegal. Because variables don't go inside ()

;; 2. It's illegal. Because the primitive application + don't accept boolean values

;; 3. It's legal. It's a expr: (primitive expr expr expr)