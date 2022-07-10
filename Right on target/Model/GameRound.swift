//
//  GameRound.swift
//  Right on target
//
//  Created by Sergey on 7/10/22.
//

import Foundation
import UIKit

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    func calcScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    func calcScore(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
}
