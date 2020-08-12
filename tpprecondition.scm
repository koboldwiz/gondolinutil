(load "tppredicateitem.scm")

;; NOTE a precondition is a list of tppredicateitems

(define (make-theorem-prover-precondition . p)
	;; a list of predicate items
	(let ((*precondition (if (not (null? p)) (car p) #f))
		)

	(define (set-precondition p)
		(set! *precondition p))	

	(define (get-precondition)
		*precondition)

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-precondition)
			((eq? msg 'get) get-precondition)
			(else (display "make-theorem-prover-precondition : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
