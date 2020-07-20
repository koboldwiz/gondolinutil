(define (make-collection-element e)
	(let ((*raw e)
		)

	(define (get)
		*raw)

	(define (set! ee)
		(set! *raw ee))

	(define (dispatch msg)
		(cond ((eq? msg 'get) get)
			((eq? msg 'set) set!)
			(else (display "make-collection-element : message not understood : ")(display msg)(newline)
			)))
	dispatch))
