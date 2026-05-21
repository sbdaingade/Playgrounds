import UIKit

var greeting = "Hello, playground"

func findAnagramWords(words:[String]) -> [[String]] {
    var anagramArray = [String: [String]]()
    
    for word in words {
        let sortedKey = String(word.sorted())
        anagramArray[sortedKey, default: []].append(word)
    }

    return Array(anagramArray.values)
}

let result = findAnagramWords(words: ["eat", "tea", "tan", "ate", "nat", "bat"])
print(result)
