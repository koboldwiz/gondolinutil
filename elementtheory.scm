
;; FIXME also make this for streams

(define (make-element-theory)
	(let ((*delimiters '(" ", ",")) 
		)

	(define (prove-theory collection)
		(do ((delimiters *delmiters (cdr delimiters)))
			((null? delimiters) #t)
			(let ((delimiter-count 0))
			(do ((coll collection (cdr coll)))
				((null? coll) #t)
				(if (eq? ((car coll) 'get) (car delimiters)) 
					(set! delimiter-count (+ 1 delimiter-count)))
				)) 
		))

	(define (dispatch msg)
		(cond ((eq? msg 'prove) prove-theory)
			(else (display "make-element-theory : message not understood : ")(display msg)(newline)
			)))
	dispatch))
