(load "collectionelement.scm")

(define (make-collection . elementtheory)
	(let ((*collection '()) ;; a list of make-collection-element's 
		(*iteratorpointer 0)
		)

	;; prolog the elementtheory above for learning how to read elements
	(define (prove-theory)
		(if (not (null? elementtheory))
		((elementtheory 'prove) dispatch)))

	;; object is made into a collection-element
	(define (add-element object)
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
	
	;; FIXME get the elements out and store every object in a new list
	(define (get-raw)
	  )

	;; returns elements list
	(define (get-raw2)
	  *collection)

	(define (dispatch msg)
		(cond ((eq? msg 'add-element) add-element)
			((eq? msg 'next) next)
			((eq? msg 'search) search)
			((eq? msg 'ref) ref)
			((eq? msg 'get-raw-list-with-objects) get-raw)
			((eq? msg 'get-raw-list-with-elements) get-raw2)
			(else (display "make-collection : message not understood : ")(display msg)(newline)
			)))

	(prove-theory)
	dispatch))
