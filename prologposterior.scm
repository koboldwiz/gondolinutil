;; (load "dictionary.scm")

;; NOTE a posterior is a list

(define (make-prolog-posterior . p)
	(let ((*posterior (if (not (null? p)) (car p) #f))
		)

	(define (set-posterior p)
		(set! *posterior p))	

	(define (get)
		*posterior)

	(define (dispatch msg)
		(cond ((eq? msg 'set) set-posterior)
			((eq? msg 'get) get)
			(else (display "make-prolog-posterior : message not understood : ")(display msg)(newline)
		)))	
	dispatch))
