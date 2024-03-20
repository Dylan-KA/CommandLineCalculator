//
//  Calculator.swift
//  calc
//
//  Created by Dylan Archer on 10/3/24.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    var inputStack :[String] = []
    var num1 :Int = 0
    var num2 :Int = 0
    var oper :String = ""
    let stringChecker = StringChecker()
    let errorHandling = ErrorHandling()
    
    func add(no1: Int, no2: Int) -> String {
        return String(no1 + no2)
    }
    
    func subtract(no1: Int, no2: Int) -> String {
        return String(no1 - no2)
    }
    
    func multiply(no1: Int, no2: Int) -> String {
        return String(no1 * no2)
    }
    
    func divide(no1: Int, no2: Int) -> String {
        errorHandling.divideByZeroCheck(no2: no2)
        return String(no1 / no2)
    }
    
    func remainder(no1: Int, no2: Int) -> String {
        return String(no1 % no2)
    }
    
    func calculate(args: [String]) -> String {

        errorHandling.checkForAllErrorTypes(arguments: args)
        if (args.count > 3) {
            var skipNextNum :Bool = false

            for currentIndex in 0..<args.count {
                let str = args[currentIndex]
                
                // Perform higher precedence calculations first and add lower precedence to the stack
                if stringChecker.isOperator(str: str) && stringChecker.higherPrecedence(str: str) {
                    let newCalculator = Calculator()
                    
                    var previousNum: String = ""
                    if let previousNumOptional :String = inputStack.last {previousNum = previousNumOptional}
                    
                    let nextIndex = currentIndex + 1
                    let nextNum: String = nextIndex < args.count ? args[nextIndex] : ""
                    
                    let newStr = newCalculator.calculate(args: [previousNum, str, nextNum])
                    if currentIndex > 0 {
                        inputStack.removeLast() // Remove previous num from stack as it will be used in recursive calculation
                    }
                    skipNextNum = true // Prevent next num from being added to stack as it is used in recursive calculation
                    inputStack.append(newStr)
                }
                if (!skipNextNum) {
                    inputStack.append(str)
                } else if (stringChecker.isNumber(str: str)) {
                    skipNextNum = false
                }            }
        } else { //add to inputStack like normal
            for str in args {
                inputStack.append(str)
            }
        }
        
        //Return early if only a single integer is given
        if (inputStack.count == 1) {
            if (inputStack[0].contains("+")) {
                inputStack[0].removeFirst()
            }
            return String(inputStack[0])
        }
                        
        while inputStack.count > 1 {
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
                inputStack.insert(add(no1: num1, no2: num2), at: 0)
            case "-":
                inputStack.insert(subtract(no1: num1, no2: num2), at: 0)
            case "/":
                inputStack.insert(divide(no1: num1, no2: num2), at: 0)
            case "x":
                inputStack.insert(multiply(no1: num1, no2: num2), at: 0)
            case "%":
                inputStack.insert(remainder(no1: num1, no2: num2), at: 0)
            default:
                // This error should already be caught by
                // errorHandling.invalidOperator
                // but just to satisfy default case
                print("error: not a valid operator: \(oper)")
                exit(EXIT_FAILURE)
            }
        }
        return("\(inputStack[0])")
    }
}
