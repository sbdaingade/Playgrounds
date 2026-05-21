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
listOfNodesB.append(1)
listOfNodesB.append(2)
listOfNodesB.append(3)
listOfNodesB.append(4)
listOfNodesB.append(5)


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
    mergedList.append(currentA?.value ?? currentB!.value)

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
