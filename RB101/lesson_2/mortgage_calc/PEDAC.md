Problem: 

Inputs:
- loan amount
- APR
- loan duration

Output: monthly payment

Implicit constraints and assumptions:
- equal monthly payments
- No partial month payment

mental model:
Grab input of loan amt, APR in %, and loan duration in months. Convert the APR into monthly interest rate. Input the values into the formula to get your monthly payment. Loop the whole thing in case the user wants to calculate again.

Example:
P = 1000
APR = 5.2
loan_duration = 13

edge cases and data validation.
- leading zeros for inputs
- enter a period. 
- has a space in the input. 
- non-numeric input

Data structure:
- store inputs as hash. 

Algorithm:
- create a method to loop the program if the user wants to calculate again
- create a method that asks the user for all the inputs
- create a method that validates the inputs
- create a method that converts the APR to monthly interest rate
- create a method that takes the inputs and the converted APR as arguments to calculate the payment amount
- Output the payment amount to the user.
