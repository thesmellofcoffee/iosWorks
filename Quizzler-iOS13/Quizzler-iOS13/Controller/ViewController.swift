//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    let quizBrain = QuizBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var questionNumber = quizBrain.questionNumber
        if (questionNumber <= 10) {
            let userAnswer = sender.currentTitle
            var wasItTrue = quizBrain.checkAnswer(userAnswer!)
            if wasItTrue{
                questionLabel.text = "Right!"
            }else{
                questionLabel.text = "False"
            }
        }
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        questionNumber += 1
    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
    }

}

