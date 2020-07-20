(load "collectionelement.scm")

(define (make-collection . elementtheory)
	(let ((*collection '())
		(*iteratorpointer 0)
		)


	;; prolog the elementtheory above for learning how to read elements
	(define (prove-theory)

		)

	;; object is made into a collection-element
	(define (add object)
		(set! *collection (append *collection 
				(list (make-collection-element object)))))

	(define (ref k)
		(if (< k (length *collection))
			(list-ref *collection k) 
			#f))

	;; FIXME see if this must be in stream or collection
	;; use an iterator
	(define (next)
		#f) ;; NOTE that the collection is empty pro forma	

	;; object is made into a collection-element
	;; use an iterator
	(define (search object)
		(do ((l *collection (cdr l)))
			((or (if (null? l) 
				#f)
			     (if (eq? (((car l) 'get)) object)
				(car l))) 
				(car l))  
		
			))

	;; FIXME implement
	;; delete is not a collection-element per se
	(define (delete object)
		#f)
	
	(define (dispatch msg)
		(cond ((eq? msg 'add) add)
			((eq? msg 'next) next)
			((eq? msg 'search) search)
			((eq? msg 'ref) ref)
			(else (display "make-collection : message not understood : ")(display msg)(newline)
			)))

	(prove-theory)
	dispatch))
