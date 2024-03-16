//
//  main.swift
//  calc
//
//  Created by Dylan Archer on 10/3/24.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: args);

print(result)

