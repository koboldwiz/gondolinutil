(load "readstream.scm")

(define (make-file-read-stream collectionobject)
	(let* ((*readstream (make-read-stream collectionobject))
	       (*fh #f) ;; file handle
		)

	(define (next)
		((*readstream 'next)))

	;; FIXME
	(define (open filename)
	  )

	(define (dispatch msg)
		(cond ((eq? msg 'next) next)

			(else (display "make-read-stream : message not understood : ")(display msg)(newline)
			)))
	))
