//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Orkun Enes on 4.04.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitter: UIStepper!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    var pctGlob: Float = 0
    var stepperNum = 2
    var total: Float = 0
    var tempPctLabel = "0"
    var totalPct: Float = 0
    @IBAction func splitterPressed(_ sender: UIStepper) {
        
        if Int(sender.value) > stepperNum{
            stepperNum += 1
            splitNumberLabel.text = String(stepperNum)
        } else if Int(sender.value) < stepperNum {
            stepperNum -= 1
            splitNumberLabel.text = String(stepperNum)
        }
        
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        tempPctLabel = sender.currentTitle!
        
        switch sender.currentTitle {
        case zeroPctButton.currentTitle:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case twentyPctButton.currentTitle:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        case tenPctButton.currentTitle:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        default:
            print("Something's seems wrong")
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func totalAreaPressed(_ sender: UITextField) {
        print(billTextField.text!)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if tempPctLabel.count == 1{
        tempPctLabel = "10"
        }
        
        tempPctLabel.removeLast()
        var pctLabel = Float(tempPctLabel)
        if pctLabel == nil{
            pctLabel = 10
        }
        var bill = Float(billTextField.text!)
        if bill == nil{
            bill = 0
        }
        var splitNumFinal = Float(splitNumberLabel.text!)
        if splitNumFinal == nil{
            splitNumFinal = 2
        }
        total = bill!
        totalPct = bill! * pctLabel!
        totalPct = totalPct / 100
        total = total + totalPct
        total = total / splitNumFinal!
        pctGlob = pctLabel!
        print(total)
        
        
        self.performSegue(withIdentifier: "goToCalculation", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculation"{
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalResult = total
            destinationVC.pctTotal = pctGlob
            destinationVC.splitCount = Float(splitNumberLabel.text!) ?? 2
            
            
        }
    }
}
