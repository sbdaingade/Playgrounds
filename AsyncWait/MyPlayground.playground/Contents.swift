import Foundation

var greeting = "Async, Wait"


func listOfName(inGallery name: String) async -> [String] {
    let result = ["sachin","test","test","test","test","test"]
    return result
}


let  strCollection = await listOfName(inGallery: "sahcin")
let a = strCollection.sorted(by: {$0 > $1})
