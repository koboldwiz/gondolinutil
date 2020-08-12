
;; a symbolic name for a parameter in a predicateitem
(define (make-theorem-prover-key key)
	(let ((*key key)
		)

	(define (get-key)
		*key)

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-key)
			((eq? msg 'key) get-key)
			(else (display "make-theorem-prover-key : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
