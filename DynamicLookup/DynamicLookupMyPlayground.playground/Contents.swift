import UIKit

var greeting = "Hello, playground"

@dynamicMemberLookup
protocol Lookable {
     subscript(dynamicMember member: String) -> String { get }
}

class Shares: Lookable {
   
    init() {}
    private let shares = ["abc": "1234","pqr": "465","pp":"44"]
    subscript(dynamicMember member: String) -> String {
        return shares[member, default: "0"]
    }

 
}

let sh = Shares()
sh.pqr


// MARK: String reverse

// Using filter

let charSet = "Sachin"

let reverse = charSet.reduce("") {"\($1)" + $0 }
print(reverse)

var str = ""
for char in reverse {
    str = "\(char)" + str
}
print(str)
