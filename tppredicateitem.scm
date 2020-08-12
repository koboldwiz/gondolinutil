(load "tptype.scm")
(load "tpkey.scm")
(load "tpvalue.scm")

(load "tpalutypes.scm") 
(load "tpaluvalues.scm") 

;; a piece of a predicate (in a tpprecondition or tpposterior) 
(define (make-theorem-prover-predicate-item type-name-symbol
						key-symbol
						. value)
	(let ((*type (make-theorem-prover-type type-name-symbol))
		(*key (make-theorem-prover-key key-symbol))
		(*value (make-theorem-prover-value (if (null? value) 

			(((make-theorem-prover-alu-values) 'empty))
			value))))

	;; the symbol which is the type
	(define (typename)
		((*type 'type)))

	;; for dispatching types (the type actor)
	(define (type)
		*type)

	;; for dispatching keys (the key actor)
	(define (key)
		*key)

	;; for dispatching values (the value actor)
	(define (value)
		*value)

	;; for filling in a value into this predicate item
	(define (fill-in-value value)
		(let ((typelist ((make-theorem-prover-alu-types))))
			(do ((typel typelist (cdr typel)))
				((null? typel) #t)
				(if ((typelist 'check) (car typel) value)
					(set! typel '('())))))) 

	(define (dispatch msg)
		(cond ((eq? msg 'typename) typename)
			((eq? msg 'type) type)
			((eq? msg 'key) key)
			((eq? msg 'value) value)

			((eq? msg 'fill-in-value) fill-in-value)

			(else (display "make-theorem-prover-predicate-item : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
