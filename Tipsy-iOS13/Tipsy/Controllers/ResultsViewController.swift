//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Orkun Enes on 4.04.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalResult: Float = 0
    var splitCount: Float = 0
    var pctTotal: Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(totalResult)
        settingsLabel.text = "Split between \(splitCount) people, with \(pctTotal) tip."

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

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

