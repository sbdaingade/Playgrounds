import UIKit

var greeting = "Find unique elements in sequence"


func findUniques<S: Sequence, T: Hashable>(arr: S) -> [T] where S.Iterator.Element == T {
    
    var resultArray = [T]()
    var uniqueSet = Set<T>()
    
    for item in arr {
        if !uniqueSet.contains(item) {
            uniqueSet.insert(item)
            resultArray.append(item)
        }
    }
    
    return resultArray
}

let arrofElements = [1,1,2,2,3,3,4,5,7,6,7]

let uniqueElements = findUniques(arr: arrofElements)
debugPrint(uniqueElements)
