concepts list
- truthy/falshy
- local variable scoping rules
- inner scope/outer scope
- variable shadowing
- object passing/variables as pointers
- reassignment
- mutability
- index assignment is mutating
- concatenation is mutating
- setters are mutating
- working with collections
- each, map, select
- sorting


Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

```

The underlying principle this demonstrates is blcok scope. the 'Hello' string object's reference value is stored in the greeting variable.

On line 6, the method loop is invocked with a block passed as an argument. The do end along with a method invocation defines a block. Inside the block, a new block scope is created. the greeting variable is reassigned a new reference value of the 'Hi' string object. The keyword break, breaks out of the loop and returns nil.

The puts method is passed the greeting variable as argument and displays the value pointed by the greeting variable which is 'Hi' as the greeting variable was reassigned in the inner scope. 

A) greeting is set to 'Hello' on line 1. greeting is set to 'Hi' on line 4. Line 8 outputs greeting, which is 'Hi'.

B) The local variable greeting is assigned to the String 'Hello' on line 1. Within the loop, greeting is then reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.

C) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.

D) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the value of the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

While none of these answers is technically incorrect, they all answer the question with varying degrees of detail and precision.

Answer 'A' describes what is happening in the code example, but does so in a fairly basic way with imprecise language. This wouldn't be a sufficient response to receive full points for any of the questions in the assessment.

Answer 'B' again describes what is happening, but with much greater precision of language. This would score higher than Answer 'A', but generally wouldn't be sufficient to receive full points for the majority of questions; most questions in the assessment are looking for something more, such as a specific piece of syntactical knowledge and perhaps identification of some fundamental concept.

Answer 'C', as well as precisely describing the example, identifies an important Ruby syntactical convention that is relevant to the example: the fact that the method invocation combined with do..end defines a block in Ruby. For some assessment questions this might be sufficient to receive full points, but many questions will expect you to demonstrate some deeper understanding of the fundamental concept that this illustrates.

Answer 'D' goes a step further than 'C' by explaining why this is important and the underlying principle that it demonstrates; i.e. the fact that method invocations with blocks in Ruby have particular scoping rules which affect whether or not the local variable can be referenced or reassigned. Note also that in answer C we say "The puts method is called on line 8 with the variable greeting passed to it as an argument," but in this answer we say "with the value of the variable greeting passed to it as an argument." You don't pass variables around - they are merely names. What you pass around is the value of that variable. Based on the way that this particular question is phrased, answer 'D' would be the only answer of the four to receive full points in an actual assessment.