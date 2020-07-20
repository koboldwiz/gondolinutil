(define (make-tokenizer pretokens delimiter) ;; pretokens is a make-collection
	(let ((*tokens (make-collection))
		)

	(define (init-rec pretokens)
		((*tokens 'add) (car pretokens))	
		(set! pretokens (cdr pretokens))
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
