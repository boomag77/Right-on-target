//
//  Generator.swift
//  Right on target
//
//  Created by Sergey on 7/10/22.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
    private let start: Int
    private let end: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else { return nil }
        start = startValue
        end = endValue
        
    }
    
    func getRandomValue() -> Int {
        return (start...end).randomElement()!
    }
}
