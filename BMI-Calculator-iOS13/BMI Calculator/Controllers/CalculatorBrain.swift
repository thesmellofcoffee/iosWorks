//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Orkun Enes on 3.04.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        if bmiValue?.value != nil {
            
            bmiValue?.value = String(format: "%.1f", (weight / (height * height)))
            
        }
        
    
    }
    
    func getBMIValue()->String{
        if bmiValue?.value != nil{
            return bmiValue!.value

        }else{
            return "bmi value is null"
        }
    }
    
    
}





