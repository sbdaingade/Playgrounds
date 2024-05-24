import UIKit

var greeting = "Hello, playground"

func reverseString (_ str: String) -> String? {
      
      guard str.count > 1 else { return str}
      var tmpStr = ""

      for char in str {
          tmpStr = "\(char)" + tmpStr
      }
      return tmpStr
  }
  
func binarySearch(_ arr: [Int], searchKey: Int) -> Int?  {
    var last = arr.count
    var first = 0
    while( first < last) {
        let mid = first + (last - first) / 2
        if (arr[mid] == searchKey) {
            return mid
        }else if (arr [mid] < searchKey) {
            first = mid + 1
        }else {
            last = mid
        }
    }
    return -1
}
  
  func quickSort(_ arr: [Int])-> [Int] {
      guard arr.count > 1 else { return arr}
      
      let mid = arr[arr.count / 2]
      
      let less = arr.filter{$0 < mid}
      let equal = arr.filter{$0 == mid}
      let greater = arr.filter{$0 > mid}
      
      return quickSort(less)  + equal + quickSort(greater)
  }
  
  func bubleSort(_ array: inout [Int]) -> [Int]? {
      var isSorted = false
      var counter = 0
      
      while !isSorted {
          isSorted = true
          for i in 0..<array.count - 1 - counter {
              if array[i] > array[i + 1] {
                  array.swapAt(i, i+1)
                  isSorted = false
              }
          }
          counter = counter + 1
      }
      return array
  }

func removeDuplicates(_ nums: inout [Int]) -> Int {
      
      var result = 1
          if(nums.count == 1) {
              return nums.count
          }
          var temp = nums[0]
          for i in 1...nums.count - 1  {
              let cur = nums[i]
              if(temp != cur){
                  nums[result] = cur
                  temp = cur
                   result = result + 1
              }
          }
          return result
  }



func isPalindrome(myString:String) -> Bool {
    let reverseString = String(myString.reversed())
    if(myString != "" && myString == reverseString) {
        return true
    } else {
        return false
    }
}


func palindrom (_ num: Int) -> Bool {
    var tempNum = num
    var reverseNumber = 0
    
    while tempNum > 0 {
         let reminder = tempNum % 10
         reverseNumber = reverseNumber * 10 + reminder
        tempNum = tempNum / 10
     }
    
    return reverseNumber == num
}

func findSumOfPairs(sum: Int, inputArray: [Int]) ->[[Int]] {
    var resultArray = [[Int]]()
    
    for i in 0..<inputArray.count - 1 {
        for j in i+1..<inputArray.count   {
            if inputArray[i] + inputArray[j] == sum {
                resultArray.append([inputArray[i],inputArray[j]])
            }
        }
        
    }
    return resultArray
}

let a = [3,5,6,2,1,5,7,1]

print(findSumOfPairs(sum: 9, inputArray: a))
