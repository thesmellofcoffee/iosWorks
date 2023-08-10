//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        if userAnswer == storyCreater.story[0].choice1{
            storyLabel.text = storyCreater.story[1].title
        } else if userAnswer == storyCreater.story[0].choice2{
            storyLabel.text = storyCreater.story[2].title
        }
        
        updateUI()
        
    }
    
    
    var storyCreater = CreateStory()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyCreater.story[0].title
        choice1Button.setTitle(storyCreater.story[0].choice1, for: .normal)
        choice2Button.setTitle(storyCreater.story[0].choice2, for: .normal)
        
    }
    func updateUI(){
        if storyLabel.text == storyCreater.story[1].title{
            choice1Button.setTitle(storyCreater.story[1].choice1, for: .normal)
            choice2Button.setTitle(storyCreater.story[1].choice2, for: .normal)

        }else if storyLabel.text == storyCreater.story[2].title{
            choice1Button.setTitle(storyCreater.story[2].choice1, for: .normal)
            choice2Button.setTitle(storyCreater.story[2].choice2, for: .normal)

        }
    }

}

