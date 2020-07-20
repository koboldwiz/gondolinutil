(load "dictionary.scm")
(load "prologpredicate.scm")
(load "prologposterior.scm")

(define (make-prolog-parser)
	(let ((*rules (make-dictionary)) ;; a list of rules, (pred . post) actor objects
		)

	(define (add-rule rule)
		(append *rules (append (list rule) *rules)))	

	;; a list single match
	(define (apply-rule-predicate rule)
		(do ((rules *rules (cdr rules)))
			((eq? (caar rule) (caar rules))
				(cadr rules))
			)
		#f) 

	;; a list multiple match ('match method)
	(define (apply-rule-predicate rule)
		(do ((rules *rules (cdr rules)))
			(((((((car rule) 'get)) 'match) ((car rules) 'get)))
				(cadr rules))
			)
		#f) 

	(define (run)
		)

	(define (dispatch msg)
		(cond ((eq? msg 'add-rule) add-rule)
			((eq? msg 'run) run)
			((eq? msg 'apply-rule) apply-rule-predicate)
			(else (display "make-prolog-parser : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
