;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 200 - Projects_Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
; A Date is a structure:
;   (make-date N N N N N N)
; interpretation An instance records six pieces of information:
; the date's year, month (between 1 and 12 inclusive), 
; day (between 1 and 31), hour (between 0 
; and 23), minute (between 0 and 59), and 
; second (also between 0 and 59).
;;(define-struct date [year month day hour minute second])
(define A-DATE1 (create-date 2011 1 7 10 25 35))
(define A-DATE2 (create-date 2014 11 18 20 11 50))
(define A-DATE3 (create-date 2015 12 27 30 0 1))
(define A-DATE4 (create-date 2016 12 28 20 10 1))
(define P-DATE1 (create-date 2018 5 17 20 20 34))
(define P-DATE2 (create-date 2018 8 23 30 40 50))
(define P-DATE3 (create-date 2018 9 11 12 13 14))
(define P-DATE4 (create-date 2018 10 2 10 0 0))

; A Track is a structure:
;   (make-track String String String N N Date N Date)
; interpretation An instance records in order: the track's 
; title, its producing artist, to which album it belongs, 
; its playing time in milliseconds, its position within the 
; album, the date it was added, how often it has been 
; played, and the date when it was last played
;;(define-struct track
;;  [name artist album time track# added play# played])
(define TRACK1
  (create-track "Brass in Pocket" "Chrissie Hynde" "The Pretenders"
                37000 10 A-DATE1 12 P-DATE1))
(define TRACK2
  (create-track "I Love Rock'N Roll" "Joan Jett" "I Love Rock'N Roll"
                32000 1 A-DATE2 14 P-DATE2))
(define TRACK3
  (create-track "Suzanne" "Leonard Cohen" "Songs by Leonard Cohen"
                48000 3 A-DATE3 20 P-DATE3))
(define TRACK4
  (create-track "Crimson and Clover" "Joan Jet" "I Love Rock'N Roll"
                45000 5 A-DATE4 21 P-DATE4))
(define TRACK5
  (create-track "Precious" "Chrissie Hynde" "The Pretenders"
                35000 10 A-DATE2 10 P-DATE2))

; An LTracks is one of:
; – '()
; – (cons Track LTracks)
(define LTRACK0 '())
(define LTRACK1 (list TRACK1))
(define LTRACK2 (list TRACK1 TRACK2 TRACK3))
(define LTRACK3 (list TRACK1 TRACK2 TRACK3 TRACK4 TRACK5))



; LTracks -> Number
; Consumes an element of LTracks and produces the total amount of play time.
(check-expect (total-time LTRACK0) 0)
(check-expect (total-time (list TRACK1)) (track-time TRACK1))
(check-expect (total-time (list TRACK1 TRACK2 TRACK3)) (+ (track-time TRACK1) (track-time TRACK2) (track-time TRACK3)))

(define (total-time lt)
  (cond
    [(empty? lt) 0]
    [else (+ (track-time (first lt)) (total-time (rest lt)))]))