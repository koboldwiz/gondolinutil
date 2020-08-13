
;; FIXME also make this for streams
;; FIXME also use decision theory

(define (make-element-theory)
	(let ((*delimiters '((string #\newline) ;; FIXME \r\n win32 
				(string #\tab) ;;FIXME
				" " 
				",")) 
		)

	;; calculates max in list of numbers and returns its position
	(define (argmax l)
		(let ((max -1)
			(maxindex 0))
			(do ((i 0 (+ i 1)))
				((null? l) maxindex)
				(if (> (car l) max)
					(begin 
						(set! max (car l))
						(set! maxindex i)))
				(set! l (cdr l))) 
		))

	;; this is the simplest sampler based on the count of the delimiters
	;; stored in *delimiters
	;; NOTE : a hash with cache can be used or a sampler such as
	;;        Metropolis-Hastings algorithm then modulus over the collection
	;;	  length
	(define (prove-theory collection)
		(let ((l '()))
		(do ((delimiters *delimiters (cdr delimiters)))
			((null? delimiters) (list-ref *delimiters (argmax (reverse l)))) ;; returns delimiter
			(let ((delimiter-count 0))
			(do ((coll collection (cdr coll)))
				((null? coll) (set! l 
						(append (list delimiter-count)
							 l)))
				(if (eq? (((car coll) 'get)) (car delimiters)) 
					(set! delimiter-count (+ 1 delimiter-count)))
				)) 
		)))

	(define (dispatch msg)
		(cond ((eq? msg 'prove) prove-theory)
			(else (display "make-element-theory : message not understood : ")(display msg)(newline)
			)))
	dispatch))
