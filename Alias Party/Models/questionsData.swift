import Foundation

struct questionsBrain {
    var question = [
        Question(q: "Driver"),
        Question(q: "Red"),
        Question(q: "Wings"),
        Question(q: "Fall"),
        Question(q: "Meal"),
        Question(q: "Great"),
        Question(q: "Sing"),
        Question(q: "Head"),
        Question(q: "Chicken"),
        Question(q: "Bed"),
        Question(q: "Humble"),
        Question(q: "Transport"),
        Question(q: "Shoes"),
        Question(q: "Accomplish"),
        Question(q: "Boast"),
        Question(q: "Feeling"),
        Question(q: "Breakfast"),
        Question(q: "Soft"),
        Question(q: "Blanket"),
        Question(q: "Bird"),
        Question(q: "Sleep"),
            ]
    
    var questionNumber = 0
    
///    func getQuestionText() -> String{
///        let qText = question[0]
///        return qText
///    }
    
///    mutating func nextQuestion() -> Int {
///        if questionNumber < question.count {
///            questionNumber = 1
///            print(questionNumber)
///            print(question.count)
///            return questionNumber
///        } else {
///            print("something")
///            questionNumber = 0
///        }
///    }
    mutating func deleteElementFromArray() {
        if question.count > 1 {
            question.remove(at:0)
            print(question)
        }else {
            print("array is empty")
        }
    }
}
