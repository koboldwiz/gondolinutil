;; alu stands for Arithmetic and Logical Unit
(define (make-theorem-prover-alu-types)
	(let ((*types (list 
			'constant
			'native
			'array
			'number
			'function
			'decimal
			'complex
			'symbol
			'boolean
			'inductive
			'variable
			'iterator
			'device
			;; add to this list for extending the type theory
			)))

	(define (get-alu-types)
		*types)

	;; type checks
	(define (native-type? type)
		(eq? type 'native))

	(define (number-type? type)
		(eq? type 'number))

	;; value checks
	(define (native-value? value)
		;;FIXME
		)

	(define (number-value? value)
		(number? value))	

	;; checks if the type has a legal value
	(define (check-type-for-value type value)
		(cond ((and (native-type? type) (native-value? value))
			#t)
			((and (number-type? type) (number-value? value))
			#t)
			(else #f)))	
					
	(define (dispatch msg)
		(cond ((eq? msg 'get) get-alu-types)
			((eq? msg 'types) get-alu-types)
			((eq? msg 'check-type-for-value) check-type-for-value)
			(else (display "make-theorem-prover-alu-types : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
