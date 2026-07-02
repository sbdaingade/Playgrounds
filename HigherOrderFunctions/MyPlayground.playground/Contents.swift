import UIKit

var greeting = "Hello, playground"

private var arrFP = [1, 2, 3, 4, 5, 6, 7, 8, 0]
private var arrPrivate = [1, 2, 3, 4, 5, 6, 7, 8, 0]
let data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let bookData = [ "book1": 127, "book2": 150, "book3": 289, "book4": 190, "book5": 950]

// MARK:  MAP
let mapedData = bookData.map({ (key, value) in return value + 40 })
print(mapedData)

// MARK:  Filter

let filterData = bookData.filter({ (key, value) in return value < 200 })
print(filterData)

let alphaN = "A!bb1a"
let alhpabetic = alphaN.filter{ $0.isLetter }
print(alhpabetic)

// MARK:  Reduce

let reducedData = data.reduce(0, { sum, number in return sum + number })
let returnSingleValue = data.reduce(0, { $0 + $1 })
let str = "SACHIN"
let reverseString = str.reduce("") {"\($1)\($0)"}
print(reducedData)
print(returnSingleValue)
print(reverseString)

//MARK: compactMap
let cMapdata = [1, nil, 3, 4, 5, 6, 7, nil, 9, 10]
let cMap = cMapdata.compactMap({ return $0 })
print(cMap)

//MARK: flatMap
let flatMappedData = "sachin"
let characters = flatMappedData.flatMap{ $0 }
print(characters)

let nestedNumbers = [[1, 2], [3, 4], [5]]
let flattened = nestedNumbers.flatMap { $0 }
print(flattened)


//MARK: compactMapValues
// ComapctMapValues for Dictionary Swift 5.0
let cDict = bookData.compactMapValues{ $0 }
print(cDict)

//MARK:  Sorted
/// Returns a new collection sorted according to the predicate logic you provide in the closure.
/// Create new copy
///
var numbers = [5, 2, 8, 1]
let descending = numbers.sorted { $0 > $1 }
debugPrint(descending)
// Output: [8, 5, 2, 1]

//MARK:  Sort
/// Because sort() mutates the underlying memory, the target collection must be explicitly declared as a variable (var).
///
numbers.sort()
debugPrint(numbers)


//MARK:  Function Chaining
/// One of the major benefits of higher-order functions is that you can chain them together sequentially to perform complex data mutations in a single, readable line of code.


let nestedScores = [[10, nil, 30], [40, 50]]

// Flatten, remove nils, and get total sum
let totalScore = nestedScores
    .flatMap { $0 }
    .compactMap { $0 }
    .reduce(0, +)
// Output: 130
debugPrint(totalScore)

//MARK:  Zip
/// Creates a sequence of pairs built out of two underlying sequences.
let A1 = [1,2,3,4]
let A2 = [5,6,7,8]

let zipResult = zip(A1, A2).map(+)
debugPrint(zipResult)
// output [6, 8, 10, 12]

let names = ["Alice", "Bob", "Charlie"]
let scores = [95, 82, 90]

for (name, score) in zip(names, scores) {
    print("\(name) scored \(score)")
}

//Querying & Grouping
//MARK:  contains:
/// Returns a boolean indicating whether the sequence contains an element that satisfies a specific condition.
///
//MARK: first(where:) / last(where:):
/// Iterates through a collection and returns the first or last element that matches a given predicate.
///
//MARK: forEach:
/// Iterates over a sequence and executes the given closure on each element. (Note: Unlike a standard for...in loop, you cannot use break or continue inside forEach).
///
//MARK: allSatisfy:
// Returns a boolean indicating whether every element in a sequence satisfies a given predicate.

//MARK: prefix(while:):
/// Returns a sequence containing the initial elements that satisfy a given predicate, stopping as soon as an element fails the condition.

//MARK: drop(while:):
///Returns a sequence containing all elements after the initial ones that fail a given predicate condition.

//MARK: split:
///Splits a collection into slices, separated by elements that match a given predicate.


/*


enum LondonAirportName {
    case stansted
    case heathrow
    case gatwick
}

enum Airports: String {
    case Tokio = "A"
    case Mumbai = "MUM"
    case Delhi = "DL"
    case munich = "MUC"
    case sanFrancisco = "SFO"
    case singapore = "SIN"
    // case london(airportName: LondonAirportName) = "LON"
}

enum Compass {
    case north, east, west, south
    case northEast(String, String)
    case barCode(Int, Int, Int, Int)
}

// Output

//["book1": 127, "book3": 289, "book4": 190, "book5": 950]

// Retain Cycle

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("the name:\(name) being deinitializing ")
    }

}

class Apartment {
    let flatNumber: Int
    weak var tanent: Person?
    init(flatNumber: Int) {
        self.flatNumber = flatNumber
    }

    deinit {
        print("the flat number:\(flatNumber) being deinitializing ")

    }
}

class Customer {
    var name: String
    var card: CreditCard?

    init(name: String){
        self.name = name
    }

    deinit {
        print("Customer \(self.name)  being deinitialized")
    }
}

class CreditCard {
    var CNumner: UInt64
    unowned var cust: Customer

    init(CNumner: UInt64, cust: Customer){
        self.CNumner = CNumner
        self.cust = cust
    }

    deinit {
        print("Credit card being deinitialized")
    }
}

class OptionalCheck {
    var NNName: String?
    var Number: Int!

    func testOP() -> String {
        return String(NNName ?? "nil" + " \(Number!)")
    }
}

var laxmi: Customer? = Customer(name: "Laxmi")
laxmi?.card = CreditCard(CNumner: 123_456_789_032, cust: laxmi!)

laxmi = nil
let ob = OptionalCheck()
ob.NNName = nil
ob.Number = nil
print(ob.testOP())

ob.Number = nil

// Weak Reference

var sachin: Person? = Person(name: "Sachin")
var dsk: Apartment? = Apartment(flatNumber: 204)

dsk?.tanent = sachin
sachin?.apartment = dsk
sachin = nil
dsk = nil

let air = Airports.Delhi.rawValue

print(air)

let ne = Compass.northEast("sachin", "Assam")

//  let br = Compass.barCode(1, 7987, 798798, 2)

print(Compass.south)
*/
