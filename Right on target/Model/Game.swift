//
//  Game.swift
//  Right on target
//
//  Created by Sergey on 7/9/22.
//

import Foundation

protocol GameProtocol {
    // quantity of points
    var score: Int {get}
    // predicted number
    var currenSecretValue: Int {get}
    var currentScore: Int { get }
    var isGameEnded: Bool {get}
    // start new game and also start first round
    func restartGame()
    // start new round (renew predicted number)
    func startNewRound()
    // check numver with predicted and give points
    func calcScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    var currentScore: Int = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currenSecretValue: Int = 0
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound { return true }
        else { return false }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currenSecretValue = self.getNewSecretValue()
        
    }
    func restartGame() {
        currentRound = 0
        score = 0
        currentScore = 0
        startNewRound()
    }
    func startNewRound() {
        currenSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    private func getNewSecretValue() -> Int {
        return (minSecretValue...maxSecretValue).randomElement()!
    }
    func calcScore(with value: Int) {
        if value > currenSecretValue {
            score += 50 - value + currenSecretValue
        } else if value < currenSecretValue {
            score += 50 - currenSecretValue + value
        } else {
            score += 50
        }
        currentScore += score
    }
}
