;; (load "dictionary.scm")

;; NOTE a precondition is a list

(define (make-theorem-prover-precondition . p)
	(let ((*precondition (if (not (null? p)) (car p) #f)) ;; a list of pred rules, a list of precondition items
		)

	(define (set-precondition p)
		(set! *precondition p))	

	(define (get)
		*precondition)

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-precondition)
			((eq? msg 'get) get)
			(else (display "make-theorem-prover-precondition : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
