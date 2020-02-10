# CSC291-A1
Shoham Shitrit
31391856
sshitrit

# To Run: 
(load "HW1")
Then, part 1 wil start running. Once you type "bye ~" in part 1, 
part two will start running.
# For Part 1:
Sample Statements Robbie Can Respond To:
1.) Whats your name?
2.) Whats your favorite movie? //accepts other questions w/ keywords favorite and movie
3.) Whats your favorite song? //accepts other questions w/ keywords favorite and song
4.) My name is ____ (Fill w/ your name)
5.) What are your hobbies
6.) Do you have friends?
7.) What is your favorite color? //accepts other combinations w/ keyowrd color
8.) Are you a human?
9.) Whats your favorite sport? //  //accepts other questions w/ keywords favorite and sport


Things to remember when inputting statements:
When finishing a statement, end it by hitting space bar and then typing a tilde (~), then pressing enter 
to see robbie's response.
To quit and see robbie's farewell to you, type "bye ~".  

*** Warnings with part 1** 
For some reason, when one runs this program, there is a so-called warning on line 42, (setq input (read-delimited-list #\~)) about how input would be undefined.
It works completely fine, and this is just how the professor said to do it in class, so I just ignored this warning. 
## Structure: 
Conversation method to run;
    -> Calls (write-response) on user input
        ->validates input based on keywords or full text
            ->uses (has-keyword)
            ->uses (name-greeting) for specialzied name greeting.

# For Part 2:

Things you can query in knowledge base-
    1.)  Checking who is a robot (Robbie, Alexa, and Siri)
    2.) Checking who likes each other. i.e. (Likes Robbie Shoham)
    3.) Checking what is a movie (Iron Man, Avengers, Star-Wars)
    4.) What Robbie Owns (processor)
Enter items into the REPL as a list. For example:
Enter arguments for ANSWER-YNQ (q to stop): (Robot Robbie) <- THIS IS HOW TO INPUT THE LIST
    -> should return (ANSWER-YNQ (ROBOT ROBBIE)) => (ROBOT ROBBIE) 
Enter arguments for ANSWER-YNQ (q to stop): (Dog Bill)
(ANSWER-YNQ (DOG Bill)) => (NOT (DOG Bill))
Enter arguments for ANSWER-YNQ (q to stop): (Bill)
(ANSWER-YNQ (Bill)) => UNKNOWN
## Structure
    (repl1 'answer-ynq) ; construcutes a repl that repeatedly calls answer-ynq until one types 'q'.
        ->calls (answer-ynq)
            ->checks (gethash) 
            ->(checks (has-predicate)
        -> prints result using (print-fun)

*** Warnings with part 2** 
For some reason, when one runs this program, there is a so-called warning on line 99, 	(setq arg1 (read)), about how arg1 would be undefined. 
It works completely fine, and this is just how the professor said to do it in class, so I just ignored this warning. 
