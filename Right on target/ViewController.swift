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
    
    // number
    var number: Int = 0
    // round
    var round: Int = 1
    //sum of points per round
    var points: Int = 0
    // last points added by Sergey
    var lastPoints: Int = 0
    // lazy var for View Controller
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController {
        // load Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // load View Controller and its scene from Main.storyboard
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        game = Game(startValue: 1, endValue: 50, rounds: 3)
        updateLabelWithSecretNumber(newText: String(game.currenSecretValue))
    }
    
    //MARK: Interaction View - Model
    
    @IBAction func checkNumber() {
        game.calcScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else { game.startNewRound() }
        updateLabelWithSecretNumber(newText: String(game.currenSecretValue))
        updateLabelWithChoosedNumber(newText: String(Int(slider.value)))
        updateLabelWithCurrentScore(newText: String(game.currentScore))
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
