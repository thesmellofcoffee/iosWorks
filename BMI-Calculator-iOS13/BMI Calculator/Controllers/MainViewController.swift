//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
 
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var height: UISlider!
    
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weight: UISlider!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 

    @IBAction func heightSliderChange(_ sender: UISlider) {
        print(height.value)
        let newHeight = String(round(height.value * 100) / 100)
        heightLabel.text = "\(newHeight)m"
        
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        print(weight.value)
        let newWeight = String(Int(weight.value))
        weightLabel.text = " \(newWeight)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let heightCalc = height.value
        let weightCalc = weight.value
  
        calculatorBrain.calculateBMI(height: heightCalc, weight: weightCalc)
        
        self.performSegue(withIdentifier: "goToResult", sender: self )
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            
            
            
            
        }
    }
}

