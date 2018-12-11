;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Exercise 204 - Projects_Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
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


; LTracks -> List-of-LTracks
; Consumes an element of LTracks. It produces a list of LTracks, one per album.
; Each album is uniquely identified by its title and shows up in the result only once.
(check-expect (select-albums '()) '())
(check-expect (select-albums LTRACK1) (list (list TRACK1)))
(check-expect (select-albums LTRACK2) (list (list TRACK1) (list TRACK2) (list TRACK3)))
(check-expect (select-albums LTRACK3) (list (list TRACK1 TRACK5) (list TRACK2 TRACK4) (list TRACK3)))

(define (select-albums lot)
  (select-albums* (select-album-titles/unique lot) lot))

; List-of-String LTracks -> List-of-LTracks
(check-expect (select-albums* '() LTRACK3) '())
(check-expect (select-albums* (list "The Pretenders") LTRACK3)
              (list (list TRACK1 TRACK5)))
(check-expect (select-albums* (list "The Pretenders" "I Love Rock'N Roll") LTRACK3)
              (list (list TRACK1 TRACK5) (list TRACK2 TRACK4)))

(define (select-albums* los lt)
  (cond
    [(empty? los) '()]
    [else (cons (select-album (first los) lt) (select-albums* (rest los) lt))]))


; String LTracks -> LTracks
; Consumes the title of an album and an LTracks.
; It extracts from the latter the list of tracks that belong to the given album.
(check-expect (select-album "abcde" LTRACK0) '())
(check-expect (select-album "The Pretenders" LTRACK3) (list TRACK1 TRACK5))
(check-expect (select-album "I Love Rock'N Roll" LTRACK3) (list TRACK2 TRACK4))

(define (select-album s lt)
  (cond
    [(empty? lt) '()]
    [else (if (string=? s (track-album (first lt)))
              (cons (first lt) (select-album s (rest lt)))
              (select-album s (rest lt)))]))

; LTracks -> List-of-Strings
; Consumes a LTracks and produces a list of unique album titles.
(check-expect (select-album-titles/unique LTRACK0) '())
(check-expect (select-album-titles/unique (list TRACK1)) (list (track-album TRACK1)))
(check-expect (select-album-titles/unique LTRACK3) (list "The Pretenders" "I Love Rock'N Roll" "Songs by Leonard Cohen"))

(define (select-album-titles/unique lt)
  (create-set (select-all-album-titles lt)))

; String Date LTracks -> LTracks
; consumes the title of an album, a date, and an LTracks.
; It extracts from the latter the list of tracks that belong
; to the given album and have been played after the given date.
(check-expect (select-album-date "I Love Rock'N Roll" P-DATE1 LTRACK3) (list TRACK2 TRACK4))
(check-expect (select-album-date "I Love Rock'N Roll" P-DATE3 LTRACK3) (list TRACK4))
(check-expect (select-album-date "The Pretenders" (create-date 2018 6 17 20 20 34) LTRACK3) (list TRACK5))

(define (select-album-date s d lt)
  (cond
    [(empty? lt) '()]
    [else (if (and (date-before? d (track-played (first lt)))
                   (string=? s (track-album (first lt))))
              (cons (first lt) (select-album-date s d (rest lt)))
              (select-album-date s d (rest lt)))]))

; Date Date -> Boolean
; Consumes two Dates and determines whether the first occurs before the second.
(check-expect (date-before? P-DATE1 P-DATE2) #true)
(check-expect (date-before? P-DATE2 P-DATE1) #false)
(check-expect (date-before? P-DATE2 P-DATE3) #true)
(check-expect (date-before? P-DATE3 P-DATE1) #false)
(check-expect (date-before? P-DATE3 P-DATE4) #true)

(define (date-before? d1 d2)
  (cond
    [(< (date-year d1) (date-year d2)) #true]
    [(> (date-year d1) (date-year d2)) #false]
    [else
     (cond
       [(< (date-month d1) (date-month d2)) #true]
       [(> (date-month d1) (date-month d2)) #false]
       [else
        (cond
          [(< (date-day d1) (date-day d2)) #true]
          [(> (date-day d1) (date-day d2)) #false]
          [else
           (cond
             [(< (date-hour d1) (date-hour d2)) #true]
             [(> (date-hour d1) (date-hour d2)) #false]
             [else
              (cond
                [(< (date-minute d1) (date-minute d2)) #true]
                [(> (date-minute d1) (date-minute d2)) #false]
                [else
                 (cond
                   [(< (date-second d1) (date-second d2)) #true]
                   [(>= (date-second d1) (date-second d2)) #false])])])])])]))

; LTracks -> List-of-Strings
; Consumes a LTracks and produces the list of album titles as a List-of-strings.
(check-expect (select-all-album-titles LTRACK0) '())
(check-expect (select-all-album-titles (list TRACK1)) (list (track-album TRACK1)))
(check-expect (select-all-album-titles (list TRACK1 TRACK2 TRACK3)) (list (track-album TRACK1) (track-album TRACK2) (track-album TRACK3)))

(define (select-all-album-titles lt)
  (cond
    [(empty? lt) '()]
    [else (cons (track-album (first lt)) (select-all-album-titles (rest lt)))]))

; List-of-Strings -> List-of-Strings
; Consumes a List-of-strings and constructs one that contains every String from the given list exactly once.
(check-expect (create-set '()) '())
(check-expect (create-set (list "abcde")) (list "abcde"))
(check-expect (create-set (list "aa" "bb" "aa" "aa" "cc" "bb" "cc" "aa" "bb" "cc" "dd" "dd")) (list "aa" "bb" "cc" "dd"))

(define (create-set los)
  (cond
    [(empty? los) '()]
    [else (cons (first los) (create-set (create-set* (first los) (rest los))))]))

; String List-of-Strings -> List-of-Strings
; Removes the String s from a Los
(check-expect (create-set* "aa" '()) '())
(check-expect (create-set* "aa" (list "aa" "bb" "cc" "aa" "aa" "bb" "dd")) (list "bb" "cc" "bb" "dd"))

(define (create-set* s los)
  (cond
    [(empty? los) '()]
    [else (if (equal? s (first los))
              (create-set* s (rest los))
              (cons (first los) (create-set* s (rest los))))]))

; LTracks -> Number
; Consumes an element of LTracks and produces the total amount of play time.
(check-expect (total-time LTRACK0) 0)
(check-expect (total-time (list TRACK1)) (track-time TRACK1))
(check-expect (total-time (list TRACK1 TRACK2 TRACK3)) (+ (track-time TRACK1) (track-time TRACK2) (track-time TRACK3)))

(define (total-time lt)
  (cond
    [(empty? lt) 0]
    [else (+ (track-time (first lt)) (total-time (rest lt)))]))