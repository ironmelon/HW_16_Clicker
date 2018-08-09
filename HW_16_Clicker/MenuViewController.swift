//
//  MenuViewController.swift
//  HW_16_Clicker
//
//  Created by Oleg Dynnikov on 8/2/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var lastScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastScoreLabel.text = ""
    }

    @IBAction func backToMenuScreen(_ segue: UIStoryboardSegue) {
        guard let gameoverVC = segue.source as? GameOverViewController else { return }
        lastScoreLabel.text = "Last Score: \(gameoverVC.score ?? 0)"
    }
}
