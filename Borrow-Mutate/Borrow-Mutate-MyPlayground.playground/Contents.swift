import UIKit
import Foundation
import XCTest

var greeting = "Hello, playground"
/// Swift 6.4 introduced two new property accessor borrow and mutate
///

// MARK: Problem

struct Storage {
    var numbers: [Int]
    init(elementCount: Int) {
        numbers = Array(repeating: 0, count: elementCount)
    }
}

struct CopyingBox {
    private var storage: Storage
    
    init(_ value: Storage) {
        self.storage = value
    }
    // MARK: Problem
    var value: Storage {
        get {storage }
        set {storage = newValue}
    }
    // MARK: Solutions
    
//    var value: Storage {
//        borrow { storage }
//        mutate { &storage }
//    }
    
}

let elementCount =  100_000
let iterations = 50

var copyingBox = CopyingBox(Storage(elementCount: elementCount))

let clock = ContinuousClock()
let getSetTime = clock.measure {
    testGetSet(&copyingBox, iterations: iterations)
}
print("Execution time: \(getSetTime)")
// output : Execution time: 2.152576375 seconds

@inline(never)
func testGetSet(_ box: inout CopyingBox,iterations: Int) {
    let count = box.value.numbers.count
    for i in 0..<iterations {
        box.value.numbers[i % count] = i
    }
}
