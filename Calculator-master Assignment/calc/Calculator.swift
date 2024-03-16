//
//  Calculator.swift
//  calc
//
//  Created by Dylan Archer on 10/3/24.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    var inputStack :[String] = []
    var num1 :Int = 0
    var num2 :Int = 0
    var oper :String = ""
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
        //let dummyArgs = ["1", "+", "2", "+", "3", "+", "4"]
        
        errorHandling.checkForAllErrorTypes(arguments: args)
        
        for str in args {
            inputStack.append(str)
        }
        
        //Return early if only a single integer is given
        if (inputStack.count == 1) {
            return String(inputStack[0])
        }
                
        //TO DO: Precedence Function to sort the order of operations
        
        while inputStack.count > 1 {
            var result :Int = 0
            
            if let num1Optional = Int(inputStack[0]) {
                num1 = num1Optional
                }
            oper = inputStack[1]
            if let num2Optional = Int(inputStack[2]) {
                num2 = num2Optional
                }
            inputStack.removeFirst(3)
            
            switch oper {
            case "+":
                result = add(no1: num1, no2: num2)
                inputStack.insert(String(result), at: 0)
            case "-":
                result = subtract(no1: num1, no2: num2)
                inputStack.insert(String(result), at: 0)
            case "/":
                result = divide(no1: num1, no2: num2)
                inputStack.insert(String(result), at: 0)
            case "x":
                result = multiply(no1: num1, no2: num2)
                inputStack.insert(String(result), at: 0)
            case "%":
                result = remainder(no1: num1, no2: num2)
                inputStack.insert(String(result), at: 0)
            default:
                // This error should already be caught by
                // errorHandling.invalidOperator
                // but just in case
                print("error: not a valid operator")
                exit(EXIT_FAILURE)
            }
        }

        return("\(inputStack[0])")
    }
}
