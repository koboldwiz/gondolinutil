;; (load "dictionary.scm")

(define (make-prolog-predicate . p)
	(let ((*predicate (if (not (null? p)) (car p) #f))
		)

	(define (set-predicate p)
		(set! *predicate p))	

	(define (get)
		*predicate)

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-predicate)
			((eq? msg 'get) get)
			(else (display "make-prolog-parser : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
