;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 166 - More on Lists|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; List-of-work -> List-of-paycheck
; Consumes a list of work records and computes a list of paychecks from it, one per record.
(check-expect (wage*.v4 '()) '())
(check-expect (wage*.v4 (cons (make-work (make-employee "Sam" 24) 8 4) (cons (make-work (make-employee "Ralph" 2) 12 8) '()))) (cons (make-paycheck (make-employee "Sam" 24) (* 8 4)) (cons (make-paycheck (make-employee "Ralph" 2) (* 12 8)) '())))

(define (wage*.v4 low)
  (cond
    [(empty? low) '()]
    [(cons? low) (cons (wage.v4 (first low)) (wage*.v4 (rest low)))]))


; Work -> Paycheck
; Consumes a Work and returns a Paycheck
(check-expect (wage.v4 (make-work (make-employee "Albert" 89) 25 40)) (make-paycheck (make-employee "Albert" 89) (* 25 40)))
(check-error (wage.v4 123) "Invalid Input")

(define (wage.v4 w)
  (if
   (work? w)
   (make-paycheck (work-employee w) (* (work-rate w) (work-hours w)))
   (error "Invalid Input")))


; A Employee is a struct
;   (make-employee (String Number)
; interpretation (make-employee name number)
; name for the employee's name and number for his work number
(define-struct employee [name number])

(define EMPLOYEEex1 (make-employee "Sam" 23))

; A Work is a structure:
;   (make-work Employee Number Number)
; interpretation (make-work e r h) combines the employee struct
; with the pay rate r and the number of hours h
(define-struct work [employee rate hours])

(define WORKex1 (make-work (make-employee "Andreu" 23) 3 5))

; List-of-work is one of: 
; – '()
; – (cons Work List-of-work)
; interpretation an instance of List-of-work represents the 
; hours worked for a number of employees
(define low1 '())
(define low2 (cons (make-work (make-employee "Andreu" 23) 3 5) '()))



; A Paycheck is a structure:
;   (make-paycheck String Number)
; interpretation (make-paycheck n a)
; n for name of the person who gets the paycheck
; a for the amount of money
(define-struct paycheck [employee amount])

(define PAYCHECKex1 (make-paycheck (make-employee "Andreu" 23) 15))

; A List-of-paycheck is one of:
; - '()
; - (cons Paycheck List-of-paycheck)
(define lop1 '())
(define lop2 (cons (make-paycheck (make-employee "Andreu" 23) 15) '()))