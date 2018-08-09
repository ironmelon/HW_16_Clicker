//
//  GameViewController.swift
//  HW_16_Clicker
//
//  Created by Oleg Dynnikov on 8/2/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var redTapButton: UIButton!
    @IBOutlet weak var blueTapButton: UIButton!
    @IBOutlet weak var greenTapButton: UIButton!

    let enableAlpha: CGFloat = 1.0
    let disableAlpha: CGFloat = 0.5
    var timer: Timer?

    var counter = 0
    var seconds = 30
    var buttonsArray: [UIButton] {
       return [redTapButton, blueTapButton, greenTapButton]
    }

// MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSecondsLabel()
        updateScoreLabel()
        updateTapButton()
    }

    
    @IBAction func tapButtonsPressed(_ sender: Any) {
        if counter == 0 { timerStarted() }
        counter += 1
        updateScoreLabel()
        updateTapButton()
    }

    func updateScoreLabel() {
        scoreLabel.text = "Score: \(counter)"
    }

// MARK: - Timer methods

    func timerStarted() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTickHandler), userInfo: nil, repeats: true)
    }

    @objc func timerTickHandler() {
        if seconds == 0 {
            timerStopped()
            performSegue(withIdentifier: "gameOverViewController", sender: nil)
        }
        seconds -= 1
        updateSecondsLabel()
    }

    func timerStopped() {
        timer?.invalidate()
        timer = nil
    }

    func updateSecondsLabel() {
        secondsLabel.text = "Seconds: \(seconds)"
    }

// MARK: - Buttons methods

    func updateTapButton() {
        let tapButton = getRandomButton()
        for button in buttonsArray {
            buttonSelected(false, button: button)
            if button == tapButton {
                buttonSelected(true, button: button)
            }
        }
    }

    func getRandomButton() -> UIButton {
        return buttonsArray[Int(arc4random_uniform(UInt32(buttonsArray.count)))]
    }

    func buttonSelected(_ value: Bool, button: UIButton) {
        button.isEnabled = value
        button.alpha = value ? enableAlpha : disableAlpha
    }

// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "gameOverViewController" else { return }
        guard let destinationVC = segue.destination as? GameOverViewController else { return }
        destinationVC.score = counter
    }
}
