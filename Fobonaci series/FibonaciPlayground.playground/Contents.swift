import Foundation
// Sachin Daingade
var greeting = "Hello, playground"


func fibonaciSeries(number: Int) {
    
    var next = 0
    var first = 0
    var second = 1
    
    for i in 0..<number {
        if i == 0 {
            next = first
        } else  {
            next = first + second
            second = first
            first = next
        }
        print(next)
    }
}
fibonaciSeries(number: 10)

