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

	(define (reduce . tpruleset) ;; ruleset are distributions of predicates
		;; reduce on itself, tpruleset is null list
		(if (null? tpruleset) 
			(let ((preitems (((car *predicate) 'get)))
				(postitems (((cdr *predicate) 'get)))))
				;; FIXME set to inductive type !
				;; use on list	
				(cond ((and (not (null? (cdr preitems)))
						(list? (cadr preitems)))
					(((car preitems) 'use) (cadr preitems))	
					;;;;;FIXME (((car postitems) 'use) (cadr postitems))
					(set! preitems (cdr preitems)) ;; skip 
					;; use on the rest of the items	
					(else (((car preitems) 'use) (cdr preitems))	
						;;;;FIXME(((car postitems) 'use) (cdr postitems))	
						(set! postitems (cdr postitems)) ;; skip 
		))

	(define (match rulep) ;; rulep is a predicate itself 
		(let ((p #f)
			(prolongedprecondition (car ((*predicate 'get)))))
		(do ((pp (car ((rulep 'get))) (cdr pp)))
			((if (null? pp) 
				#f
				(if (eq? p #t) 
					#t
					#f)))
			(if (and (eq? (((car pp)'typename)) 
				      (((car prolongedprecondition) 'typename)))
				(eq? (((((car pp) 'key)) 'get)) 
					(((((car prolongedprecondition)) 'key)) 'get)))
				(if (and (not (null? prolongedprecondition))
					(null? (cdr prolongedprecondition)))
					(set! p #t))
				(set! prolongedprecondition (cdr prolongedprecondition))
				)))) 

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-predicate)
			((eq? msg 'get) get)
			((eq? msg 'match) match)
			((eq? msg 'reduce) reduce)
			(else (display "make-theorem-prover-predicate : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
