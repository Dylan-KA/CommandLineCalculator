//
//  ErrorHandling.swift
//  calc
//
//  Created by Dylan Archer on 10/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class ErrorHandling {
    
    let stringChecker = StringChecker()
    
    func checkForAllErrorTypes(arguments: [String]) {
        illegalCharacters(arguments: arguments)
        invalidOperator(arguments: arguments)
        startsWithNumber(arguments: arguments)
        endsWithNumber(arguments: arguments)
        consecutiveNumbers(arguments: arguments)
        consecutiveOperators(arguments: arguments)
    }
    
    //Given arguments, checks if it contains illegal charaters (
    func illegalCharacters(arguments: [String]) {
        for str in arguments {
            if (!stringChecker.isOperator(str: str) && !stringChecker.isNumber(str: str)) {
                print("invalid args: contains illegal characters: \(str)")
                exit(EXIT_FAILURE)
            }
        }
    }
    
    //Given arguments, checks if there is more than one operator within a single string
    func invalidOperator(arguments: [String]) {
        for str in arguments {
            if (stringChecker.isOperator(str: str) && str.count > 1) {
                print("invalid arguments: operator is invalid: \(str)")
                exit(EXIT_FAILURE)
            }
        }
    }
    
    //Given arguments, checks if it starts with a number
    func startsWithNumber(arguments: [String]) {
        if (!stringChecker.isNumber(str: arguments[0])) {
            print("invalid args: first arg is not an integer number")
            exit(EXIT_FAILURE)
        }
    }
    
    //Given arguments, checks if ends with a number
    func endsWithNumber(arguments: [String]) {
        if (!stringChecker.isNumber(str: arguments[arguments.count-1])) {
            print("invalid args: last arg is not a number")
            exit(EXIT_FAILURE)
        }
    }
    
    //Given arguments, checks if there are consecutive numbers
    func consecutiveNumbers(arguments: [String]) {
        var numCount = 0
        for str in arguments {
            if (stringChecker.isNumber(str: str)) {
                numCount = numCount + 1
                if (numCount == 2) {
                    print("invalid args: consecutive numbers")
                    exit(EXIT_FAILURE)
                }
            } else {
                numCount = 0
            }
        }
    }
    
    //Given arguments, checks if there are consecutive operators
    func consecutiveOperators(arguments: [String]) {
        var operCount = 0
        for str in arguments {
            if (stringChecker.isOperator(str: str)) {
                operCount = operCount + 1
                if (operCount == 2) {
                    print("invalid args: consecutive operators")
                    exit(EXIT_FAILURE)
                }
            } else {
                operCount = 0
            }
        }
    }
    
}
