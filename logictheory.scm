(load "dictionary.scm")
;; NOTE : uses predicate and posterior of propositional logic
(load "tppredicate.scm")
;;(load "tpprecondition.scm")
;;(load "tpposterior.scm")

(define (make-logic-theory)
	(let ((*validities (make-dictionary))
		)


	(define (enter-validities)
		;; NOTE that the key is a number (to be hashed) and the value
		;; of the dictionary is a predicate
		((*validities 'add) 0 (make-theorem-prover-predicate
			;; p and q (as booleans) 
		(cons (make-theorem-prover-precondition '(
			(make-theorem-prover-predicate-item 'operator-and 'and ) 
							'(
			(make-theorem-prover-predicate-item 'boolean 'p ) 
			(make-theorem-prover-predicate-item 'boolean 'q )
						     )))
			;; is q and p 
		(make-theorem-prover-posterior '(
			(make-theorem-prover-predicate-item 'operator-and 'and ) 
							'(
			(make-theorem-prover-predicate-item 'boolean 'q ) 
			(make-theorem-prover-predicate-item 'boolean 'p )
						     )))
			)))
		
		;; NOTE : an example of further theory, the above using numbers
		;;((*validities 'add) 0.1 (make-theorem-prover-predicate
		;;	;; p and q (as boolean and/or numbers) 
		;;(cons (make-theorem-prover-precondition '(
		;;	(make-theorem-prover-predicate-item 'operator-and 'and ) 
		;;					'(
		;;	(make-theorem-prover-predicate-item 'number 'p ) 
		;;	(make-theorem-prover-predicate-item 'number 'q )
		;;				     )))
		;;	;; is q and p 
		;;(make-theorem-prover-posterior '(
		;;	(make-theorem-prover-predicate-item 'operator-and 'and ) 
		;;					'(
		;;	(make-theorem-prover-predicate-item 'number 'q ) 
		;;	(make-theorem-prover-predicate-item 'number 'p )
						     )))
		;;	)))
		)
		

		)

	(define (test-theory)
		;; FIXME test if precondition items are equal to postconditions items, for example:  #f <-> #f
		)

	(define (prove-theory)
		)

	(define (dispatch msg)
		(cond ((eq? msg 'prove) prove-theory)
			(else (display "make-logic-theory : message not understood : ")(display msg)(newline)
			)))

	(enter-validities) ;; fill with validities in propositional logic

	dispatch))
