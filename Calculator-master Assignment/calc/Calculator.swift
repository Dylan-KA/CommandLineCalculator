//
//  Calculator.swift
//  calc
//
//  Created by Dylan Archer on 10/3/24.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    var numbers :[Int] = []
    var operators :[String] = []
    let stringChecker = StringChecker()
    let errorHandling = ErrorHandling()
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        if (no2 == 0) {
            print("Error: can't divide by zero")
            exit(EXIT_FAILURE)
        }
        return no1 / no2
    }
    
    func remainder(no1: Int, no2: Int) -> Int {
        return no1 % no2
    }
    
    func calculate(args: [String]) -> String {
        
        //Dummy args
        let dummyArgs = ["1", "+", "2", "+", "3", "+", "4"]
        
        errorHandling.checkForAllErrorTypes(arguments: dummyArgs)
        
        //Iterate through args to find which are numbers and which are operators
        for str in dummyArgs {
            if (stringChecker.isNumber(str: str)) {
                if let num = Int(str) {
                    numbers.append(num)
                }
            }
            if (stringChecker.isOperator(str: str)) {
                operators.append(str)
            }
        }
        
        //Return early if only a single integer is given (useful for recursive calls)
        if (operators.count == 0) {
            return String(numbers[0])
        }
        
        var result :Int = 0
        
        //TO DO: Precedence Function to sort the order of operations
                
        if (operators.count == 1) {
            
            switch operators[0] {
            case "+":
                result = add(no1: numbers[0], no2: numbers[1])
            case "-":
                result = subtract(no1: numbers[0], no2: numbers[1])
            case "/":
                result = divide(no1: numbers[0], no2: numbers[1])
            case "x":
                result = multiply(no1: numbers[0], no2: numbers[1])
            case "%":
                result = remainder(no1: numbers[0], no2: numbers[1])
            default:
                // This error should already be caught by
                // errorHandling.invalidOperator
                // but just in case
                print("error: not a valid operator")
                exit(EXIT_FAILURE)
            }
        }
        
        return("\(result)")
    }
}
