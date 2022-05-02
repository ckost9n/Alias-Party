//
//  actionModel.swift
//  Alias Party
//
//  Created by Konstantin on 02.05.2022.
//

import Foundation

struct Action {
    let action: String
    
    static func getActions() -> [Action] {
        return [
            Action(action: "Один"),
            Action(action: "Два"),
            Action(action: "Три"),
            Action(action: "Четыре"),
            Action(action: "Пять")
        ]
    }
}
