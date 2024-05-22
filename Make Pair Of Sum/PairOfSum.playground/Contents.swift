import UIKit

/*
 
 There is an input array. say [1,4,3,5,0,2,3]
 There is also a number say n = 5
 Print all the pairs from the array that makes the sum n = 5
 So the output would be :
 [[1,4],[3,2],[5,0],[2,3]]
 */



let inputArray = [1,4,3,5,0,2,3]

func makePair(_ sum: Int, arr: [Int]) -> [[Int]] {
    var resultArray = [[Int]]()
    for j in 0..<arr.count - 1  {
        for i in j+1..<arr.count  {
            if arr[j] + arr[i] == sum {
                resultArray.append([arr[j],arr[i]])
            }
        }
    }
    
    return resultArray
}

let output = makePair(5, arr: inputArray)
debugPrint(output)
