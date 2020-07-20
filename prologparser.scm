(load "dictionary.scm")
(load "prologpredicate.scm")

(define (make-prolog-parser)
	(let ((*rules (make-dictionary))
		)

	(define (add-rule rule)
		(append *rules (append (list rule) *rules)))	

	(define (apply-rule-single-predicate rule)
		(do ((rules *rules (cdr rules)))
			((eq? (caar rule) (caar rules))
				(cadr rules))
			)
		#f) 

	(define (run)
		)

	(define (dispatch msg)
		(cond ((eq? msg 'add-rule) add-rule)
			((eq? msg 'run) run)
			(else (display "make-prolog-parser : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
