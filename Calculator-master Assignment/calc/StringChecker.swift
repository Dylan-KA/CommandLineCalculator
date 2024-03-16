//
//  StringChecker.swift
//  calc
//
//  Created by Dylan Archer on 11/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class StringChecker {
    
    //Returns true if the given string is a number
    func isNumber(str: String) -> Bool {
        let numbers = "0123456789"
        if (str == "+" || str == "-") {
            return false
        }
        for char in str {
            if (!numbers.contains(char) && char != "-" && char != "+") {
                return false
            }
        }
        return true
    }

    //Returns true if the given string is an operator
    func isOperator(str: String) -> Bool {
        let operators = "+-x/%"
        for char in str {
            if (!operators.contains(char)) {
                return false
            }
        }
        return true
    }
    
}


