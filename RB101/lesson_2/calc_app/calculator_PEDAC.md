Input
- Two integers from user
- One operation from user

Output
- Calculation based on the inputted two integers and operation given by user

Implicit requirement
- Validate input from the user, it should be able to take in both integers and floats
- Loop back if invalid input

Mental model
- Ask the user for the first number. If it's an integer or float ask for the second number and store the first number. If not, show an error message and loop back to ask for the first number again. Do the same for the second number.  
- Ask the user for the operation to be performed. If it is one of our four options, store it. If not, loop back and show an error message and ask for the operation again.  
- Based on the operation entered, use a conditional statement to perform the calculation. Capture the return value in a variable
- Output the return value to the user.
- Ask the user if they want to do another calculation. If yes, loop back to the where the program asks for the first number. If not, break out of the program and end. 


Examples
- num1 = 3, num2 = 5 operation = 'multiply' => '15'
- num1 = 3.0 num2 = 3 operation = 'division' => 1.0
- num1 = 'dfda' => should loop back to ask for first number again
- num1 = 03 num2 = 002.3 operation = 'subtract' => not sure how to validate this edge case. validates if equal to 1 or 2 leading zeros?

Data structures
- use yaml file for storing messages in hash format
- Hash for holding operation options

Pseudocode

- Ask the user for their name. Once entered display a message to the user. 
- Create a loop to encase our main part of the program.
- declare the num1 variable with an empty string. 
- Create a second level loop for the first number input. 
  - Inside the second level loop, ask the user for the first number and store that in a variable. 
  - Call the number validation method and pass in the variable that holds the user inputted first number. It should return true or false. If it returns true break out of the program, else message the user that its an invalid input. Loop back to the top of the second level loop.
- declare the num2 variable with an empty string.
- Create a second level loop for the second number input.
  - inside the second level loop, ask the user for the second number and store that in a variable.
  - call the number validation method and pass in the variable that holds the user inputted second number. It should return true or false. If it returns true break out of the program, else message the user that it's an invalid input. Loop back to top of this loop. 
- Declare an operation variable with an empty string.
- Create a second level loop for the operation input
  - Inside the loop, print to the screen the user's options for operation and asks for the input. 
  - Create a new method for the below.   
    - If the input is 'add' or '1', use the + operator on the two numbers
    - If the input is 'subtract' or '2' use the - operator on the two numbers
    - If the input is 'multiply' or '3' use the * operator on the two numbers
    - If the input is 'divide' or '4' use the / operator on the two numbers
    - If it is none of the above, message the user that the input is invalid and do it again. Return false. 
  - Store the return of the conditional statement to the operation variable.
  - Break out of loop unless the operation variable is equal to false.
- Print out the results to the user
- Print to the user if they want to do another calculation. 
- Get input from the user and store it inside go_again variable. 
- break out of loop if it equals 'n' or 'no'. Not case sensistive. 
- Print a thank-you to the user. 


 
  




