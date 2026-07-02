import UIKit

var greeting = "Hello, playground"

private var arrFP = [1, 2, 3, 4, 5, 6, 7, 8, 0]
private var arrPrivate = [1, 2, 3, 4, 5, 6, 7, 8, 0]
let data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let bookData = [ "book1": 127, "book2": 150, "book3": 289, "book4": 190, "book5": 950]

    let mapedData = bookData.map({ (key, value) in return value + 40 })
    print(mapedData)
  
    let filterData = bookData.filter({ (key, value) in return value < 200 })
    print(filterData)

    let reducedData = data.reduce(0, { sum, number in return sum + number })
    let returnSingleValue = data.reduce(0, { $0 + $1 })
    print(reducedData)
    print(returnSingleValue)


    let cMapdata = [1, nil, 3, 4, 5, 6, 7, nil, 9, 10]
    let cMap = cMapdata.compactMap({ return $0 })
    print(cMap)

let flatMappedData = ["sachin"]
    let characters = flatMappedData.flatMap({ return $0 })
    //let bookData = ["book1":127, "book2": nil ,"book3": 289 ,"book4": 190, "book5": 950  ]

    //   let newFValue = bookData.flatMap({return $0})

    //   print(newFValue)
    print(characters)

// ComapctMapValues for Dictionary Swift 5.0

    let cDict = bookData.compactMapValues({ return $0 })
    print(cDict)


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
