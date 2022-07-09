//
//  ViewController.swift
//  Right on target
//
//  Created by Sergey Burdakov on 7/6/22.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet var displayNum: UILabel!
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
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // generate new number
        self.number = Int.random(in: 1...50)
        // provide number value to Label
        self.label.text = String(self.number)
    }
    
    
    @IBAction func displayNumber() {
        self.displayNum.text = String(Int(self.slider.value.rounded()))
    }
    
    @IBAction func checkNumber() {
        // get the value from slider
        let numSlider = Int(self.slider.value.rounded())
        // check value with predicted value
        // count points
        self.displayChoose.text = String(Int(self.slider.value.rounded()))
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        self.displayPoints.text = String(self.points)
        if self.round == 5 {
            // info window with result of game
            let alert = UIAlertController(
                title: "Game over!",
                message: "You earned \(self.points) points (Last was \(self.lastPoints))", // added by Sergey
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Start again", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.lastPoints = self.points // added by Sergey
            self.points = 0
            self.displayChoose.text = "-"
        } else {
            self.round += 1
        }
        // generate random number
        self.number = Int.random(in: 1...50)
        // provide value to Label
        self.label.text = String(self.number)
    }
}
