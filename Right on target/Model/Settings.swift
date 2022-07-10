//
//  Settings.swift
//  Right on target
//
//  Created by Sergey on 7/10/22.
//

import Foundation

protocol SettingsProtocol {
    var numberOfRounds: Int { set get }
}
class Settings: SettingsProtocol {
    var numberOfRounds: Int = 3
    
    func getNumberOfRounds() -> Int {
        return self.numberOfRounds
    }
    
    func setNumberOfRounds(number: Int) {
        self.numberOfRounds = number
    }
}
