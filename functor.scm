(define (make-functor f)
  (let ((*f f))
    
    (define (do . args)
      (f args))

    	(define (dispatch msg)
		(cond ((eq? msg 'do) do)
		      ((eq? msg 'apply) do)
		      (else (display "make-functor : message not understood : ")(display msg)(newline))))

	dispatch))
