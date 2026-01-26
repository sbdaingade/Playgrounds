import UIKit

var greeting = "Hello, playground"

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
   
    func printList() {
        var currentNode = head
        while let node = currentNode {
            print(node.value)
            currentNode = node.next
        }
    }
}

let listOfNodesA = LinkedList<Int>()
listOfNodesA.append(1)
listOfNodesA.append(2)
listOfNodesA.append(3)
listOfNodesA.append(4)
listOfNodesA.append(5)
//listOfNodesA.printList()


let listOfNodesB = LinkedList<Int>()
listOfNodesB.append(6)
listOfNodesB.append(8)
listOfNodesB.append(9)
listOfNodesB.append(12)
listOfNodesB.append(14)


func mergeSortedLists<T: Comparable>(_ listA: LinkedList<T>, _ listB: LinkedList<T>) -> LinkedList<T> {
    let mergedList = LinkedList<T>()
    var currentA: Node<T>? = listA.head
    var currentB: Node<T>? = listB.head
    
    while let nodeA = currentA, let nodeB = currentB {
        if nodeA.value < nodeB.value {
            mergedList.append(nodeA.value)
            currentA = nodeA.next
        } else {
            mergedList.append(nodeB.value)
            currentB = nodeB.next
        }
    }
  
    while let nodeA = currentA {
        mergedList.append(nodeA.value)
        currentA = nodeA.next
    }
    
    while let nodeB = currentB {
        mergedList.append(nodeB.value)
        currentB = nodeB.next
    }

    return mergedList
}


func printListK<T>(_ mergedList: LinkedList<T>) {
    var currentNode = mergedList.head
    while let node = currentNode {
        print(node.value)
        currentNode = node.next
    }
}


let result = mergeSortedLists(listOfNodesA, listOfNodesB)
printListK(result)
