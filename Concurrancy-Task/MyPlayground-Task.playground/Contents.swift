import Foundation
import Combine

var greeting = "Hello, playground"

// MARK: Basic Task

Task {
    await testTask()
}

func testTask() async {
    print("Hello World")
}
//========================================================

// MARK: Task with result

let result = await Task<Int, Never> {
    return 3
}.value

debugPrint(result)
//========================================================

// MARK: cancellable Task

let task = Task {
    try await longRunningTask()
}
task.cancel()

if Task.isCancelled {
    debugPrint("Task was cancelled")
}

func longRunningTask() async throws -> Int {
  //   try await Task.sleep(nanoseconds: 66)
    return 3
}

//========================================================

// MARK: Structured Concurrancy

Task {
    async let a = fetchA()
    async let b = fetchB()
    
    let aData = try await a
    let bData = try await b
    
    print(aData)
    print(bData)
}


func fetchA() async throws -> String {
    
    return "Fetched A's Data"
}

func fetchB() async throws -> String {
    
    return "Fetched B's Data"
}

//========================================================

// MARK: TASK Priority

/// userInitiated
/// high
/// medium
/// low
/// utility
/// background


Task(priority: .background) {
    await doBackgroundWork()
}

func doBackgroundWork() async {
    debugPrint(" Background task")
}
//========================================================

// MARK: Detached TASK

Task.detached(priority: .userInitiated) {
     await doBackgroundWork()
}
