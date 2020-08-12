(load "tpprecondition.scm")
(load "tpposterior.scm")

;; NOTE a predicate is a list
;; FIXME : add .left .right .middle .X methods

(define (make-theorem-prover-predicate . p)
	;; a cons cell of tpprecondition and tpposterior 
	(let ((*predicate (if (not (null? p)) (car p) #f))
		)

	(define (set-predicate p)
		(set! *predicate p))	

	(define (get)
		*predicate)

	(define (match rulep) ;; rulep is a predicate itself 
		(let ((p #f)
			(prolongedprecondition (car ((*predicate 'get)))))
		(do ((pp rulep (cdr pp)))
			((if (null? pp) 
				#f
				(if (eq? p #t) 
					#t
					#f)))
			(if (eq? (car pp) (car prolongedprecondition))
				(set! prolongedprecondition (cdr prolongedprecondition))
				(if (null? (cdr pp))
					(set! p #t))))
		)) 

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-predicate)
			((eq? msg 'get) get)
			((eq? msg 'match) match)
			(else (display "make-theorem-prover-predicate : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
