(define (make-collection-element e)
	(let ((*raw e)
		)

	(define (get-element)
		*raw)

	(define (set-element! ee)
		(set! *raw ee))

	(define (dispatch msg)
		(cond ((eq? msg 'get-element) get-element)
			((eq? msg 'set-element!) set-element!)
			(else (display "make-collection-element : message not understood : ")(display msg)(newline)
			)))
	dispatch))
