(define (make-theorem-prover-type type)
	(let ((*type type)
		)

	(define (get-type)
		*type)

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-type)
			((eq? msg 'type) get-type)
			(else (display "make-theorem-prover-type : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
