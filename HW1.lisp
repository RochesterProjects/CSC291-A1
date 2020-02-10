(defun has-keyword(l x) ;checking if a list has atom x
	(if (eq l nil)
		nil
		(if(eq (car l) x)
			t
			(has-keyword (cdr l) x) ;checking if each element of the set is in set,  until no more elements
		)
	)

)

(defun name-greeting (input)
	(format t "~%Hello, ~a! It's great to meet you." (last input)) ;assume last word is the name.
)
(defun write-response (input) ; this function takes user input and tries to match it to the appropriate output that Robbie will say. 
    (cond ;has combinations of comparing to full sentences and checking if a certain keyword exists. 
       ((equalp input (list 'Are 'you 'a 'human? )) 
       (format t "~%Is this a real question? I am Robbie the ROBOT."))
	   ((and (has-keyword input 'favorite) (has-keyword input 'color?)) (format t "~%My favorite color is black."))
	   ( (equalp input (list 'What 'are 'your 'hobbies?)) (format t "~%I have no hobbies. I am a boring simple chatbot. All I do is talk."))
		((and (has-keyword input 'favorite) (has-keyword input 'sport?)) (format t "~%Favorite sport? Hm...Competitve Calculating."))
		((and (has-keyword input 'favorite) (has-keyword input 'song?)) (format t "~%Robot Rock by Daft Punk. Do I even have to explain..."))
		((and (has-keyword input 'favorite) (has-keyword input 'movie?)) (format t "~%Iron Man. I always imagine I'm Jarvis!"))
        ((has-keyword input 'from?) (format t "~%I am from Rochester, but I hate the snow."))
		((has-keyword input 'name?) (format t "~%My name is Robbie. You knew that. Duh."))
		((and (has-keyword input 'My) (has-keyword input 'name)) (name-greeting input)) ;greeting specified by name
		 ((equalp input (list 'Do 'you 'have 'friends? )) 
		 (format t "~%Yes! Alexa and Siri are my favorite friends. I despise Cortana though, shes so annoying."))
		((equalp (car input) 'bye)
        nil) ;exit condition. Robbie will say nothing from these responses.
       (t (format t "~%I do not understand...Ask me something else.")); deafult message for queries I did not implement.
    )
)



(defun conversation() ;question 1 
    (format t "Conversation Time! Type \"bye\" to quit. Remember to end your statements with a tilde.Lets Go!~%")
	(format t "Robbie: Hello! I am Robbie the robot. Whats your name?")
    (loop
    (format t "~%You:") 
	(setq input (read-delimited-list #\~)) ;read from input, delimit it, then send it to write-response
    (write-response input)
	(when (equalp (car input) 'bye) (return (format t "~%Bye Bye, human!~%"))) ;check for bye, then print farewell.
    ) 

)
(conversation) 


;question 2

;; setting knowledge base.
(defparameter *KB* (make-hash-table :test #'equal))
    (setf (gethash '(Robot Robbie) *KB*) T)
	(setf (gethash '(Robot Alexa) *KB*) T)
	(setf (gethash '(Robot Siri) *KB*) T)
    (setf (gethash '(Likes Robbie Samantha) *KB*) T)
	(setf (gethash '(Likes Robbie Shoham) *KB*) T)
	(setf (gethash '(Likes Robbie Romeo) *KB*) T)
	(setf (gethash '(Likes Robbie Lebron) *KB*) T)
    (setf (gethash '(Dog Rover) *KB*) T)
    (setf (gethash '(Bark Rover) *KB*) T)
	(setf (gethash '(Likes Robbie Juliet) *KB*) T)
	(setf (gethash '(Owns Robbie Processor) *KB*) T)
	(setf (gethash '(Owns Robbie Processor) *KB*) T)
	(setf (gethash '(Movie Iron-Man) *KB*) T)
	(setf (gethash '(Movie Avengers) *KB*) T)
	(setf (gethash '(Movie Star-Wars) *KB*) T)
	(setf (gethash '(Movie Parasite) *KB*) T)






(defun has-predicate (wff) ;; for each key in KB, check if the first element is equal to the first element of wff.
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
(defun repl1(f) ;repl for part two. Enter elements in a list. Ex: (Robot Robbie)
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