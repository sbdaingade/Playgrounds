import UIKit

var greeting = "Hello, Playground"

func findAlphabets(withString input: String) -> String? {
    
    let result = input.filter{("A"..."Z").contains($0)}
    return result
}

let result = findAlphabets(withString: greeting)
debugPrint(result)


func reverseString(withString input: String) -> String {
    let str = input.reduce(""){"\($1)" + $0}
    return str
}

let reverseStr = reverseString(withString: greeting)
debugPrint(reverseStr)
