import Dispatch
import Foundation

// A shared mutable object
var balance = 100

// A concurrent queue
let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)

// A lock object
let lock = NSLock()

// A function that withdraws money from the balance
func withdraw(amount: Int) {
  // Acquire the lock
  lock.lock()
  // Check if there is enough balance
  if balance >= amount {
    // Simulate some delay
    Thread.sleep(forTimeInterval: 0.1)
    // Deduct the amount from the balance
    balance -= amount
  } else {
      debugPrint("can not withdrow money")
  }
  // Release the lock
  lock.unlock()
}

// Two threads trying to withdraw money at the same time
queue.async {
  withdraw(amount: 80)
}

queue.async {
  withdraw(amount: 90)
}

// Wait for the threads to finish
queue.sync(flags: .barrier) {}

// Print the final value of the balance
print(balance)
