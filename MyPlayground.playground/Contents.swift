import UIKit

var greeting = "Hello, playground"

let lowercase = "a"..."z"
print(lowercase)
print(lowercase.contains("c"))


let underFive = 0.0..<5.0
// Quickly check
underFive.contains(3.14)
underFive.contains(4.99999999)
underFive.upperBound


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
hasAnyMatches(list: numbers, condition: { $0 < 10 })
