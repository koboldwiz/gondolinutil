(define (make-stream collectionobject)
	(let* ((*collection collectionobject)
		(*iterator (make-collection-iterator *collection))
		)

	;; FIXME rewind
	(define (next)
		(let ((n ((*iterator 'next))))
		(if n n (and ((*iterator 'rewind)) ((*itertor 'next))))
		))	

	(define (dispatch msg)
		(cond ((eq? msg 'next) next)

			(else (display "make-stream : message not understood : ")(display msg)(newline)
			)))
	))
