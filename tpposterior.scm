;; NOTE a posterior is a list of tppredicateitems

(define (make-theorem-prover-posterior . p)
	(let ((*posterior (if (not (null? p)) (car p) #f))
		)

	(define (set-posterior p)
		(set! *posterior p))	

	(define (get)
		*posterior)

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-posterior)
			((eq? msg 'get) get)
			(else (display "make-theorem-prover-posterior : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
