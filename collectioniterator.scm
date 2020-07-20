
;; NOTE : watch for reference to collection, it must be reset as it changes

(define (make-collection-iterator collectionobject)
	(let ((*collection collectionobject)
		(*iteratorpointer 0) ;; this should be a pointer (e.g. in C++ STL)
		)

	(define (next)
		((*collection 'ref) *iteratorpointer)
		(set! *iteratorpointer (+ *iteratorpointer 1))
		) 	

	(define (rewind . k)
		(set! *iteratorpointer (if (and (not (null? k)) 
						(number? (car k)))
						(car k)
						0)))

	(define (dispatch msg)
		(cond ((eq? msg 'next) next)
			(else (display "make-collection-iterator : message not understdood : ")(display msg)(newline))
		))
	dispatch))
