import Dispatch
import Foundation

// A shared mutable object
var counter = 0

// A concurrent queue
let queue = DispatchQueue(label: "com.sachindaingade.queue", attributes: .concurrent)

// A lock object
let lock = NSLock()

// A function that increments the counter with a lock
func incrementWithLock() {
  // Acquire the lock
  lock.lock()
  // Increment the counter
  counter += 1
  // Release the lock
  lock.unlock()
}

// Two threads incrementing the counter with the same function
queue.async {
  for _ in 0..<1000 {
    incrementWithLock()
  }
}

queue.async {
  for _ in 0..<1000 {
    incrementWithLock()
  }
}

// Wait for the threads to finish
queue.sync(flags: .barrier) {}

// Print the final value of the counter
print(counter)
