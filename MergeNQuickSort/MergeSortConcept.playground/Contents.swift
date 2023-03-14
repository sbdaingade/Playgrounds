import UIKit

// Sachin Daingade


func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count/2
    
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))
    
    return mergeSort(left, right)
}

func mergeSort(_ left:[Int],_ right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    
    var result = [Int]()
    result.reserveCapacity(left.count + right.count)
    
    while leftIdx < left.count && rightIdx < right.count {
        // right is greater than left
        if left[leftIdx] < right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
            
            // left is greater than right
        }else if left[leftIdx] > right[rightIdx] {
            result.append(right[rightIdx])
            rightIdx += 1
        }else {
            // left right are equal
            result.append(left[leftIdx])
            result.append(right[rightIdx])
            leftIdx += 1
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        result.append(left[leftIdx])
        leftIdx += 1
    }
    while rightIdx < right.count {
        result.append(right[rightIdx])
        rightIdx += 1
    }
    
    return result
}

let unSortedNumber = [5,48,3,45,978,48,468,73,48,4,3,9,6,1,4,92,0]

let sortedR = mergeSort(unSortedNumber)
print("Sorted values: \(sortedR) \n\n")


//MARK: QUICK Sort

func quickSort(array :[Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let mid = array[array.count / 2]
    
    let less = array.filter{$0 < mid}
    let equal = array.filter{$0 == mid}
    let more = array.filter{$0 > mid}
    
    return  quickSort(array:less) + equal + quickSort(array: more)
    
}


let quicksortedR = quickSort(array: unSortedNumber)
print(quicksortedR)
