//
//  Game.swift
//  Right on target
//
//  Created by Sergey on 7/9/22.
//

import Foundation

protocol GameProtocol {
    // quantity of points
    var score: Int { get }
    var currentRound: GameRoundProtocol! { get }
    var isGameEnded: Bool { get }
    var secretValueGenerator: GeneratorProtocol { get }
    func restartGame()
    // start new round (renew predicted number)
    func startNewRound()
}

class Game: GameProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    
    var isGameEnded: Bool {
        if roundsCount == rounds.count { return true }
        else { return false }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
        
    }
    func restartGame() {
        rounds = []
        startNewRound()
    }
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
}
