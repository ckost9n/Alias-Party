//
//  questions.swift
//  Alias Party
//
//  Created by Mac on 04.05.2022.
//

import Foundation

enum ActionEnum: String {
    case one = "Один"
    case two = "Два"
    case three = "Три"
    case four = "Четыре"
}

struct WordData {
    
    static let one: Set<String> = ["Driver", "Red", "Wings", "Fall", "Meal"]
    
    static let two: Set<String> = ["Great", "Sing", "Head", "Chicken", "Bed", "Humble"]
    
    static let three: Set<String> = ["Transport", "Shoes", "Accomplish", "Boast", "Feeling" ]
    
    static let four: Set<String> = ["Breakfast", "Soft", "Blanket", "Bird", "Sleep"]
    
}

struct Word {
    
    static func getWords(action: ActionEnum) -> Set<String> {
        switch action {
        case .one: return WordData.one
        case .two: return WordData.two
        case .three: return WordData.three
        case .four: return WordData.four
        }
    }
    
}


