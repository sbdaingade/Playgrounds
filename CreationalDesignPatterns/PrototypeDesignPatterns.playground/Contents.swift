import UIKit
import Foundation
var greeting = "Hello, playground"

///Defination:  Create new objects from existing objects
/// Prototype design pattern doen not support value type.
/// need to define copying type shallow copy or deep copy
///


class Player: NSObject, NSCopying {
   
    var name: String
    var score: Double
    init(name: String, score: Double) {
        self.name = name
        self.score = score
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Player(name: self.name, score: self.score)
    }
}

let player = Player(name: "Sachin Daingade", score: 99)
let playerCopy = player.copy() as! Player

playerCopy.name = "Amol"
playerCopy.score = 30
/*
debugPrint(player.name)
debugPrint(player.score)

debugPrint(playerCopy.name)
debugPrint(playerCopy.score)

 /*
  output
  "Sachin Daingade"
  99.0
  "Amol"
  30.0
 */
 
 */
//============================================================
// Shallow Copy
//============================================================

class Meeting: NSObject, NSCopying {
    var name: String
    var location: Location
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Meeting(name: self.name, location: self.location)
    }
    
}

class Location {
    var place: String
    
    init(place: String) {
        self.place = place
    }
}

let meeting = Meeting(name: "Team Meeting", location: Location(place: "Bangalore"))
let clone = meeting.copy() as! Meeting

clone.location.place = "Pune"

debugPrint(meeting.location.place)
debugPrint(clone.location.place)
/// shallow copy memory location is same for clone

 /* output
  meeting.location.place --> "Pune"
  clone.location.place --> "Pune"
  */

/// Shallow copying will copy the references when we are loading the prototype object


//============================================================
// Deep Copy
//============================================================

class Student: NSObject, NSCopying {
    var name: String
    var department: Department
    
    init(name: String, department: Department) {
        self.name = name
        self.department = department
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Student(name: self.name, department: department.copy() as! Department)
    }
}

class Department: NSObject, NSCopying {

    var name: String
    init(name: String) {
        self.name = name
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Department(name: self.name)
    }

}


let student = Student(name: "Sachin", department: Department(name: "Engineerig"))
let studentClone = student.copy() as! Student

studentClone.department.name = "Mechanical"
debugPrint(student.department.name)
debugPrint(studentClone.department.name)
