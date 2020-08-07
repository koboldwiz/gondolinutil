;; (load "dictionary.scm")

;; NOTE a predicate is a list
;; FIXME : add .left .right .middle .X methods

(define (make-theorem-prover-predicate . p)
	(let ((*predicate (if (not (null? p)) (car p) #f)) ;; a list of pred rules, a list of predicate items
		)

	(define (set-predicate p)
		(set! *predicate p))	

	(define (get)
		*predicate)

	(define (match rulep) ;; rulep is a predicate (list of pred elements) 
		(let ((p #f)
			(prolongedpredicate *predicate))
		(do ((pp rulep (cdr pp)))
			((eq? p #t) #t)
			(if (and (eq? (car pp) (car prolongedpredicate))
				(null? (cdr pp)))
				(set! p #t)))
		)) 

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-predicate)
			((eq? msg 'get) get)
			((eq? msg 'match) match)
			(else (display "make-theorem-prover-predicate : message not understood : ")(display msg)(newline)
		)))	
	dispatch))