# RpnCalculator

The RPN Calculator is an implementation of a Reverse Polish Notation (RPN) calculator.

The calculator currently supports addition, subtraction, multiplication, and division.

Pass in any number of positive and negative numbers in the order you would like them to be operated upon and end each statement with the operator or a text representation of the operator.

Happy calculating!

## Installation

**Note a local installation of Erlang is required to run this application**

Just download this repository.

## Usage

cd into the `rpn_calculator` directory and create an operation by calling the application `path_to_application/rpn_calculator` and passing in the positive or negative numbers you want to operate on, followed by the operator type.

Currently supported operators: `+, sum, add, -, subtract, x, multiply, /, divide`

Non numbers passed into the application as arguments will be ignored.

Example Inputs/Outputs
--------------------


    > ./rpn_calculator 1 1 +
    > 2
    > ./rpn_calculator 2 2 sum
    > 4
    > ./rpn_calculator 2 4 add
    > 6
    > ./rpn_calculator 3 1 -
    > 2
    > ./rpn_calculator 3 -1 -
    > 4
    > ./rpn_calculator 13 1 subtract
    > 0
    > ./rpn_calculator 1 1 x
    > 1
    > ./rpn_calculator 1 -1 x
    > -1
    > ./rpn_calculator 2 2 multiply
    > 4
    > ./rpn_calculator 3 1 /
    > 3
    > ./rpn_calculator 13 1 divide
    > 13

---

## Architecture

This application is built in Elixir and is the first command line program I've written in any language. I chose to write this in Elixir because I knew that there was excellent tooling for building this type of application in a quick, elegant, and extensible way. Testing and bundling into an executable (**that requires erlang**) are arbitrarily easy to setup and configure. I would have been comfortable writing this in Python and Javascript and might have had an easier time developing an interface that better managed state. To address the functional nature this implementation I made it such that a user could input as many arguments as necessary for each operation.
