#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

(define (ins_beg el lst)
  (display "Hello, I'm ins_beg!\n")
  (cons el lst))

(define (ins_end el lst)
  (display "Hello, I'm ins_end!\n")
  (append lst (list el)))

(define (cout_top_level list)
  (display "Hello, I'm cout_top_level\n")
  (define t 0)
  (define (count lst)
      (if  (empty? lst)
           (display "Finished counting elements\n")
           (begin
             (set! t (+ t 1))
             (count (cdr lst)))))
   (count list)
   (display t))

(define (count_instances el list)
  (display "Hello, I'm count_instances\n")
  (define t 0)
  (define (count lst)
    (if (empty? lst)
        (display "Finished counting instances\n")
        (begin
          (if (eq? el (car lst))
              (set! t (+ t 1))
          (set! t t))
          (count (cdr lst)))))
  (count list)
  (display t))

(define (count_instances_tr el list)
  (display "Hello, I'm count_instances_tr\n")
  (define (count_tr lst running_total)
    (if (empty? lst)
        (begin
        (display "Finished counting instances\n")
        (display running_total))
        (begin
          (if (eq? el(car lst))
            (count_tr (cdr lst) (+ running_total 1))
            (count_tr (cdr lst) running_total)))
        ))
  (count_tr list 0))

(define (count_instances_deep el list)
  (display "Hello I'm count_instances_deep\n")
  (define t 0)
  (define (count lst)
    (if (empty? lst)
        (void)
        (begin
          (if (eq? el (car lst))
              (begin
                (set! t (+ t 1))
                (count (cdr lst)))
              (begin
                (if (number? (car lst))
                    (count (cdr lst))
                    (begin
                      (count (car lst))
                      (count (cdr lst)))))))))
  (count list)
  (display "Finished counting instances\n")
  (display t))