//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
    var leftDiceNumber = 1
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let randNum1 = Int.random(in: 0...5) // It will create random number inclusivly 0 and 5
        let randNum2 = Int.random(in: 0...5)

        let diceArray = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]
        
        
        diceImageView1.image = diceArray[randNum1]
        // diceArray.randomElement() --> This one supposed to work but it isn't
        diceImageView2.image = diceArray[randNum2]
        
        

    }
    
    
}
