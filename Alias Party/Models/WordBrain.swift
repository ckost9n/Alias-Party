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
