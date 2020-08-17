;; alu stands for Arithmetic and Logical Unit
(define (make-theorem-prover-alu-values)
	(let ((*values (list ;; fixed order, extend at the end of the list
			'empty
			;; add to this list for extending the values 
			)))

	(define (get-alu-values)
		*values)

	(define (empty-value)
		(car *values))

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-alu-values)
			((eq? msg 'values) get-alu-values)
			((eq? msg 'empty-value) empty-value)
			(else (display "make-theorem-prover-alu-values : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
