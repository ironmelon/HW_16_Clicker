//
//  GameOverViewController.swift
//  HW_16_Clicker
//
//  Created by Oleg Dynnikov on 8/2/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = score {
            scoreLabel.text = "Your score: \(value)"
        } else { scoreLabel.text = "Your score: None" }
    }
}
