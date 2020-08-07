(load "dictionary.scm")

(define (make-theorem-prover)
	(let ((*rules '())
		)

	(define (add-rule rule)
		(append *rules (append (list rule) *rules)))	

	(define (dispatch msg)
		(cond ((eq? msg 'add) add-rule)
			(else (display "make-theorem-prover : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
