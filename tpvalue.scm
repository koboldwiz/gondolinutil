
;; a value for a parameter in a predicateitem 
(define (make-theorem-prover-value value)
	(let ((*value value)
		)

	(define (get-value)
		*value)

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-value)
			((eq? msg 'value) get-value)
			(else (display "make-theorem-prover-value : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
