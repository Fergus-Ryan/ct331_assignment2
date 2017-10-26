#lang racket
(define (make-tree node left-branch right-branch)
  (list node left-branch right-branch))

(define (node tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (leaf? tree)
  (if (null? (left-branch tree))
      (if (null? (right-branch tree))
          #t
          #f)
      #f))

(define tree1 (make-tree 4 null null))
(define tree2 (make-tree 7 null null))
(define tree3 (make-tree 6 tree1 tree2))
(set! tree1 (make-tree 1 null null))
(define tree4 (make-tree 3 tree1 tree3))
(set! tree1 (make-tree 13 null null))
(set! tree2 (make-tree 14 tree1 null))
(define tree5 (make-tree 10 null tree2))
(define tree (make-tree 8 tree4 tree5))

(define (in? el tr)
  
  (if (eq? (node tr) null)
      #f
      (if (eq? el (node tr))
          #t
          (begin
            (if (not (leaf? tr))
                (if (< el (node tr))
                    (in? el (left-branch tr))
                    (in? el (right-branch tr)))
                #f)))))
  

(define (insert el tr)
  (if (null? tr)
      (make-tree el null null)
      (if (< el (node tr))
          (make-tree (node tr) (insert el (left-branch tr)) (right-branch tr))
          (make-tree (node tr) (left-branch tr) (insert el (right-branch tr))))
      ))

(define trEnd (make-tree 0 null null))
(define (insertAll lst tr)
  (display "\n")
  
  (if (not (empty? lst))
      (begin
        (set! trEnd (insert (car lst) tr))
        (print trEnd)
        (insertAll (cdr lst) trEnd))
      (void)))
             


>(in? 7 tree)
>(insert 9 tree)
>(insertAll '(2 5 9) tree)
>(display trEnd)