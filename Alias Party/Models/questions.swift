//
//  questions.swift
//  Alias Party
//
//  Created by Mac on 04.05.2022.
//

import Foundation

struct Question {
    let text:String
    
    init(q: String){
        text = q
    }
}

struct Question2 {
    
    
    static func getData() -> Set<String> {
        let questionsData: Set = [
            "Driver",
            "Red",
            "Wings",
            "Fall",
            "Meal",
            "Great",
            "Sing",
            "Head",
            "Chicken",
            "Bed",
            "Humble",
            "Transport",
            "Shoes",
            "Accomplish",
            "Boast",
            "Feeling",
            "Breakfast",
            "Soft",
            "Blanket",
            "Bird",
            "Sleep",
        ]
        
        return questionsData
    }
    
}


