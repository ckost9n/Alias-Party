//
//  ScoreCalculation.swift
//  Alias Party
//
//  Created by Mac on 06.05.2022.
//

import Foundation
struct ScoreCalculation {
    
    var teamId = "TeamOne"
    var scoreTeamOne = 0
    var scoreTeamTwo = 0

    mutating func addUpScore() -> Int {
        if teamId == "TeamOne" {
            scoreTeamOne += 1
            print("Счет первой команды: \(scoreTeamOne)")
            return scoreTeamOne
        } else if teamId == "TeamTwo" {
            scoreTeamTwo += 1
            print("Счет второй команды: \(scoreTeamTwo)")
            return scoreTeamTwo
        } else {
            print("What`s happend")
            return 0
        }
    }
    mutating func actionAddUpScore() -> Int {
        if teamId == "TeamOne" {
            scoreTeamOne += 3
            print("Прибавка от действия первой команде")
            return scoreTeamOne
        } else if teamId == "TeamTwo"{
            scoreTeamTwo += 3
            print("Прибавка от действия второй команде")
            return scoreTeamTwo
        } else{
            print("What`s happend in actionAddUpScore()")
            return 0
        }
    }
    mutating func substractAction() -> Int{
        if teamId == "TeamOne"{
            scoreTeamOne -= 1
            print("Отнятие 1 от счета первой команды")
            return scoreTeamOne
        } else if teamId == "TeamTwo"{
            scoreTeamTwo -= 1
            print("Отнятие 1 от счета второй команды")
            return scoreTeamTwo
        } else{
            print("What`s happend in substractAction()")
            return 0
        }
    }
    mutating func teamChanging() -> String {
        if teamId == "TeamOne" {
            teamId = "TeamTwo"
            return teamId
        } else{
            teamId = "TeamOne"
            return teamId
        }
    }
}
