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

	(define (keyname)
		((*key 'get)))

	(define (value-value)
		((*value 'get)))

	;; for dispatching types (the type actor)
	(define (type)
		*type)

	;; for dispatching keys (the key actor)
	(define (key)
		*key)

	;; for dispatching values (the value actor)
	(define (value)
		*value)

	(define (use predicateitems)
		(cond	((eq? (typename) 'operator-and) ;; prefixed operator with args as the rest of the list the operator is in
			(let ((returnvalue #t))
			(do ((items predicateitems (cdr items)))
				((null? items) returnvalue) ;;FIXME returnvalue must be a number or boolean make-
				(cond ((or (eq? (((car items) 'typename)) 'boolean)
					   (eq? (((car items) 'typename)) 'number))
					(set! returnvalue  
					(and (((car items) 'value-value)) returnvalue)))
					((list? (car items)) ;; FIXME set return
					(use (car items)))
					(else (set! returnvalue 'empty) ;; FIXME tpaluvalues empty-value method
						(set! items '('xyzzy))
					) 
				))))
			((eq? (typename) 'operator-or)
			(let ((returnvalue #t))
			(do ((items predicateitems (cdr items)))
				((null? items) returnvalue) ;;FIXME returnvalue must be a number or boolean make-
				(cond ((or (eq? (((car items) 'typename)) 'boolean)
					   (eq? (((car items) 'typename)) 'number))
					(set! returnvalue  
					(or (((car items) 'value-value)) returnvalue))

					((list? (car items)) ;; FIXME set return
					(use (car items)))
					(else (set! returnvalue 'empty) ;; FIXME tpaluvalues empty-value method
						(set! items '('xyzzy))
					) 

					)))))
			((eq? (typename) 'operator-not)
			(let ((returnvalue #t))
			(do ((items predicateitems (cdr items)))
				((null? items) returnvalue) ;;FIXME returnvalue must be a number or boolean make-
				(cond ((or (eq? (((car items) 'typename)) 'boolean)
					   (eq? (((car items) 'typename)) 'number))
					(set! returnvalue  
					(and (not (((car items) 'value-value))) returnvalue))

					((list? (car items)) ;; FIXME set return
					(use (car items)))
					(else (set! returnvalue 'empty) ;; FIXME tpaluvalues empty-value method
						(set! items '('xyzzy))
					) 

			)))))
			((eq? (typename) 'function-call) 
			
				)
			
			(else 'empty 
			)	
		))
	;; for filling in a value into this predicate item
	;; 
	(define (fill-in-value value)
		(let ((typelist ((make-theorem-prover-alu-types))))
			(do ((typel typelist (cdr typel)))
				((cond ((eq? (car typel) 'xyzzy) #t)
					((null? typel) #f)))
					
				;; check if the typename exists, then match it
				;; and set its value
				(if (and ((typelist 'check-type-for-value) (car typel) value) (eq? (car typel (typename))))
					(begin
						((*value 'set) value)
						(set! typel '('xyzzy 'xyzzy))))))) 

	(define (dispatch msg)
		(cond ((eq? msg 'typename) typename)
			((eq? msg 'type) type)
			((eq? msg 'keyname) keyname)
			((eq? msg 'key) key)
			((eq? msg 'value-value) value-value)
			((eq? msg 'value) value)

			((eq? msg 'use) use)

			((eq? msg 'fill-in-value) fill-in-value)

			(else (display "make-theorem-prover-predicate-item : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
