(load "dictionary.scm")
;; NOTE : uses predicate and posterior of propositional logic
(load "tppredicate.scm")
(load "tpposterior.scm")

(define (make-logic-theory)
	(let ((*validities (make-dictionary))
		)


	(define (enter-validities)
		;; FIXME fill in variable objects
		((*validities 'add) (list (make-theorem-prover-predicate)
					(make-theorem-prover-posterior)))	
		)

	(define (prove-theory)
		)

	(define (dispatch msg)
		(cond ((eq? msg 'prove) prove-theory)
			(else (display "make-logic-theory : message not understood : ")(display msg)(newline)
			)))

	(enter-validities) ;; fill with validities in propositional logic

	dispatch))
