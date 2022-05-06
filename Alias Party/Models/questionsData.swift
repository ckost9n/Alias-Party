import Foundation

struct questionsBrain {
    
    var question2 = Question2.getData()
    
    mutating func deleteElementFromArray2(value: String) {
        if question2.count > 1 {
            question2.remove(value)
        }else {
            print("array is empty")
            question2 = Question2.getData()
        }
    }
}
