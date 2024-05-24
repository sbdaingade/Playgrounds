import UIKit

var greeting = "Hello, playground"
let vowels = ["a","e", "i","o","u"]


func findVowelCount(strData: String) -> Int {
    var count = 0
    let newChar = strData.compactMap{$0}
    for i in newChar {
        if (vowels.contains("\(i.lowercased())")) {
            count += 1
            print(i)
        }
    }
    return count
}
findVowelCount(strData: greeting)
