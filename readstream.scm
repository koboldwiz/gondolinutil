(load "stream.scm")

(define (make-read-stream collectionobject)
	(let* ((*stream (make-stream collectionobject))
		)

	(define (next)
		((*stream 'next)))

	(define (dispatch msg)
		(cond ((eq? msg 'next) next)

			(else (display "make-read-stream : message not understood : ")(display msg)(newline)
			)))
	))
