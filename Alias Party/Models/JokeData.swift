//
//  JokeData.swift
//  Alias Party
//
//  Created by Андрей Яфаркин on 02.05.2022.
//

import Foundation

struct JokeData:Codable {
    let id: Int
    let setup: String
    let punchline: String
}
