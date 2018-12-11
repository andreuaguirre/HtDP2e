;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 220 - Projects_Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH 10) ; # of blocks, horizontall
(define SIZE 10) ; blocks are squares
(define HSIZE (/ SIZE 2))
(define SCENE-SIZE (* WIDTH SIZE))

(define BLOCK ; red squares with black rims
  (overlay
    (square (- SIZE 1) "solid" "red")
    (square SIZE "outline" "black")))

(define BACKGROUND (empty-scene SCENE-SIZE SCENE-SIZE))

; A Block is a structure:
;   (make-block N N)
(define-struct block [x y])
; Interpretation:
; (make-block x y) depicts a block whose left 
; corner is (* x SIZE) pixels from the left and
; (* y SIZE) pixels from the top;
(define BLOCKL1 (make-block 0 9))
(define BLOCKL2 (make-block 1 9))
(define BLOCKNB1 (make-block 0 8))
(define BLOCKNB2 (make-block 1 8))
(define BLOCKD1 (make-block 5 1))
(define FIRSTBLOCK (make-block HSIZE 0))

; A Landscape is one of: 
; – '() 
; – (cons Block Landscape)
(define LANDSCAPE0 '())
(define LANDSCAPE1 (list BLOCKL1 BLOCKL2))
(define LANDSCAPEBNB1 (list BLOCKL1 BLOCKNB1))
(define LANDSCAPEBNB2 (list BLOCKL1 BLOCKNB1 BLOCKL2 BLOCKNB2))
 
; A Tetris is a structure:
;   (make-tetris Block Landscape)
(define-struct tetris [block landscape])
; Interpretation:
; (make-tetris b0 (list b1 b2 ...)) means b0 is the
; dropping block, while b1, b2, and ... are resting
(define TETRIS1 (make-tetris BLOCKD1 LANDSCAPE1))
(define TETRIS2 (make-tetris BLOCKD1 LANDSCAPEBNB2))



;; RENDER

; Tetris -> Image
; Renders a Tetris game
(check-expect (render TETRIS1) (renderb BLOCKD1 (renderl LANDSCAPE1)))

(define (render t)
  (renderb (tetris-block t) (renderl (tetris-landscape t))))

; Landscape Image -> Image
; Renders a Landscape
(check-expect (renderl LANDSCAPE0) BACKGROUND)
(check-expect (renderl LANDSCAPE1) (renderb BLOCKL1 (renderb BLOCKL2 BACKGROUND)))

(define (renderl l)
  (cond
    [(empty? l) BACKGROUND]
    [else (renderb (first l) (renderl (rest l)))]))

; Block Image -> Image
; Renders a Block
(check-expect (renderb (make-block 5 3) BACKGROUND) (place-image BLOCK (+ (* 5 SIZE) HSIZE) (+ (* 3 SIZE) HSIZE) BACKGROUND))

(define (renderb b i)
  (place-image BLOCK
               (+ (* SIZE (block-x b)) HSIZE)
               (+ (* SIZE (block-y b)) HSIZE)
               i))