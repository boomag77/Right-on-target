//
//  ViewController.swift
//  Right on target
//
//  Created by Sergey Burdakov on 7/6/22.
//
import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet var displayPoints: UILabel!
    @IBOutlet var displayChoose: UILabel!
    
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 3)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //MARK: Interaction View - Model
    
    @IBAction func checkNumber() {
        game.currentRound.calcScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else { game.startNewRound() }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
        updateLabelWithChoosedNumber(newText: String(Int(slider.value)))
        updateLabelWithCurrentScore(newText: String(game.score))
    }
    
    //MARK: Update View
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    private func updateLabelWithChoosedNumber(newText: String) {
        displayChoose.text = newText
    }
    private func updateLabelWithCurrentScore(newText: String) {
        displayPoints.text = newText
    }
    private func showAlertWith(score: Int) {
        let alert = UIAlertController (title: "Game over!",
                                       message: "Your score is \(score) points",
                                       preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
