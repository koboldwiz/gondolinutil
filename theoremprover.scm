(load "dictionary.scm")

(define (make-theorem-prover)
	(let ((*rules '())
		)

	(define (add-rule rule)
		(append *rules (append (list rule) *rules)))	

	(define (dispatch msg)
		(cond ((eq? msg 'search) search)
			(else (display "make-prolog-parser : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
