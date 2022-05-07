import Foundation

struct WordsBrain {
    
    var action: ActionEnum
    var words: Set<String>
    
    mutating func deleteElementFromWords(value: String) {
        if words.count > 1 {
            words.remove(value)
        }else {
            words = Word.getWords(action: action)
        }
    }
    
    
    init(action: ActionEnum) {
        self.action = action
        words = Word.getWords(action: action)
    }
}

struct ScoreCalculate {
    var teamId = "TeamTwo"
    var scoreTeamOne = 0
    var scoreTeamTwo = 0
    
    mutating func addUpScore() {
        if teamId == "TeamOne" {
            scoreTeamOne += 1
            print("Счет первой команды: \(scoreTeamOne)")
            
        } else if teamId == "TeamTwo" {
            scoreTeamTwo += 1
            print("Счет второй команды: \(scoreTeamTwo)")
            
        } else {
            print("What`s happend")
            
        }
    }
    mutating func addUpScoreAction(){
        if teamId == "TeamOne" {
            scoreTeamOne += 3
            print("+3 1")
        }else if teamId == "TeamTwo" {
            scoreTeamTwo += 3
            print("+3 2")
        }
    }
    mutating func addOneToTeamOne() {
        scoreTeamOne += 1
        print(scoreTeamOne)
        print("Прибавка 1 первой команде от кнопки Команда 1 ")
    }
    mutating func addOneToTeamTwo() {
        scoreTeamTwo += 1
        print (scoreTeamTwo)
        print("Прибавка 1 второй команде от кнопки Команда 2 ")
    }
    mutating func teamChanging() {
        if teamId == "TeamOne" {
            teamId = "TeamTwo"
            
        } else{
            teamId = "TeamOne"
            
        }
    }
    
    mutating func getScoreTeamOne() -> Int{
        let score1 = scoreTeamOne
        print(score1)
        return score1
    }
    mutating func getScoreTeamTwo() -> Int{
        let score2 = scoreTeamTwo
        print(score2)
        return score2
    }
    
}
