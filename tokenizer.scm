(define (make-tokenizer pretokens delimiter)
	(let ((*tokens #f)
		)

	(define (init)
		(init-rec pretokens))		

	(define (next)

	(define (dispatch msg)
		(cond ((eq? msg 'next) next)
			(else (display "make-tokenizer : message not understood : ")(display msg)(newline)
		)))

	(init)

	dispatch))
