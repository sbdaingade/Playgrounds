import Combine
import Foundation

// 1. Create the base publisher (e.g., networking)
let scorePublisher = Timer.publish(every: 1.0, on: .main, in: .default)
    .autoconnect()
    .map { _ in "Score: \(Int.random(in: 0...5))-\(Int.random(in: 0...5))" }
    .makeConnectable() // 2. Make it connectable

// 3. Attach multiple subscribers
let sub1 = scorePublisher.sink { print("Table View received: \($0)") }
let sub2 = scorePublisher.sink { print("Banner View received: \($0)") }

// 4. Connect AFTER both are subscribed
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print("--- Connecting Now ---")
    scorePublisher.connect()
}

let subject = PassthroughSubject<Int, Never>()

// Create a connectable publisher
let connectable = subject
    .print("Debug")
    .makeConnectable()

// Subscribe first
let subscription1 = connectable
    .sink { value in
        print("Subscriber 1 received: \(value)")
    }

let subscription2 = connectable
    .sink { value in
        print("Subscriber 2 received: \(value)")
    }

// Nothing happens yet, even though we have subscribers

// Now manually connect
let connection = connectable.connect()

// Now values will flow to all subscribers
subject.send(1)
subject.send(2)
