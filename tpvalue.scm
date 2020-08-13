
;; a value for a parameter in a predicateitem 
(define (make-theorem-prover-value value)
	(let ((*value value)
		)

	(define (get-value)
		*value)

	(define (set-value)
		*value)

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-value)
			((eq? msg 'value) get-value)
			((eq? msg 'set) set-value)
			(else (display "make-theorem-prover-value : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
