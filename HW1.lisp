(defun has-keyword(l x)
	(if (eq l nil)
		nil
		(if(eq (car l) x)
			t
			(has-keyword (cdr l) x) ;checking if each element of the set is in set,  until no more elements
		)
	)

)
(defun has-keywords (l x y)
	(if (has-keyword l x)
		(format t "~%has first one")  
		(if (has-keyword l y)
		(format t "~%has second one")
		t)
	)
	nil
)
(defun name-greeting (input)
	(format t "~%Hello, ~a! It's great to meet you." (last input)) ;assume last word is the name.
)
(defun write-response (input)
    (format t "~{~a~^~}" input)    
    (cond
       ((equalp input (list 'Are 'you 'a 'human? )) 
       (format t "~%Is this a real question? I am Robbie the ROBOT."))
	   ((and (has-keyword input 'favorite) (has-keyword input 'color?)) (format t "~%My favorite color is black."))
	   ( (equalp input (list 'What 'are 'your 'hobbies?)) (format t "~%I have no hobbies. I am a boring simple chatbot. All I do is talk."))
       ((equalp (car input) 'bye)
        nil)
        ((has-keyword input 'from?) (format t "~%I am from Rochester, but I hate the snow."))
		((has-keyword input 'name?) (format t "~%My name is Robbie. You knew that. Duh."))
		((and (has-keyword input 'My) (has-keyword input 'is)) (name-greeting input))
       (t (format t "~%I do not understand...Ask me something else."))
    )
)



(defun conversation() ;question 1 
    (format t "Conversation Time! Type \"help\" to see what I am capable of, or type \"bye\" to quit.Lets Go!~%")
	(format t "Robbie: Hello! I am Robbie the robot. Whats your name?")
    (loop
    (format t "~%You:") 
	(setq input (read-delimited-list #\~))
    (write-response input)
	(when (equalp (car input) 'bye) (return (format t "~%Bye Bye, human!~%"))) ;check for q
    ) 

)
;(conversation)


;question 2
(defparameter *KB* (make-hash-table :test #'equal))
    (setf (gethash '(Robot Robbie) *KB*) T)
    (setf (gethash '(Likes Robbie Samantha) *KB*) T)
    (setf (gethash '(Dog Rover) *KB*) T)
    (setf (gethash '(Bark Rover) *KB*) T)

(defun has-predicate (wff)
	(loop for k being each hash-key of *KB*

		thereis (equalp (car k) (car wff)) 
	)
)
(defun answer-ynq (wff)
	
    (cond 
		((gethash wff *KB*) (format nil "~a" wff))
		((has-predicate wff) (format nil "(NOT ~a)" wff))
		(t (format nil "UNKNOWN"))
	)
    
)
; creating interactive repl 

(defun print-fun (f a) ;evaluate and print function "E, P"
	(format t "(~a ~a) => ~a ~%" f a (funcall f a))
)
(defun repl1(f) ;repl for 1 arg
	(format t "Enter arguments for ~a (q to stop): " f)
	(finish-output nil)
	(setq arg1 (read))
	(if (equalp (format nil "~a" arg1) "q") ;check for q
		nil
		(if (print-fun f arg1)
			nil
			(repl1 f)
		)		
	)

)
(repl1 'answer-ynq)