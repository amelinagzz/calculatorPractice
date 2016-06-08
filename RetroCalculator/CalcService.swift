//
//  CalcService.swift
//  RetroCalculator
//
//  Created by Adriana Gonzalez on 5/17/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import Foundation

class CalcService{
    
    static let instance = CalcService()
    
    enum Operation : String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Clear
    }
    
    func multiply(numStrA:String, numStrB:String) -> String?{
        
        if let numA = Double(numStrA), let numB = Double(numStrB){
            return "\(numA * numB)"
        }
        else{
            return nil
        }
    }

    func divide(numStrA:String, numStrB:String) -> String?{
        
        if let numA = Double(numStrA), let numB = Double(numStrB){
            return "\(numA / numB)"
        }
        else{
            return nil
        }
    }

    func add(numStrA:String, numStrB:String) -> String?{
        
        if let numA = Double(numStrA), let numB = Double(numStrB){
            return "\(numA + numB)"
        }
        else{
            return nil
        }
    }

    func subtract(numStrA:String, numStrB:String) -> String?{
        
        if let numA = Double(numStrA), let numB = Double(numStrB){
            return "\(numA - numB)"
        }
        else{
            return nil
        }
    }

}
