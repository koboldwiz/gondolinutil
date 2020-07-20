(load "prologparser.scm")

(define (make-prolog-setup . parser)
	(let ((*prologparser (if (null? parser)
				(make-prolog-parser)
				(car parser)))
		)

		

	(define (dispatch msg)
		(cond ((eq? msg 'search) search)
			(else (display "make-prolog-setup : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
