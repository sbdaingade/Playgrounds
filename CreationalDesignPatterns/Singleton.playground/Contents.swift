import UIKit

var greeting = "Hello, playground"
//MARK: old

/// In Swift 6, using classes for singletons can be complex due to strict data-race safety rules. Because a standard class is not inherently thread-safe, you often have to use locks or @unchecked Sendable to prevent compiler warnings.
///
final class MyClass: @unchecked Sendable {
    static let shared = MyClass()
    private init() {}
}
/// ❌ DANGER: Multiple threads can read/write this simultaneously, causing data races or app crashes. The compiler will NOT warn you.



//MARK: new
/// By defining your singleton directly as an actor, Swift automatically handles thread safety, ensuring all mutable state is serialized and race-condition free at compile-time.


actor MyActor {
    static let shared = MyActor()
    private init() {}
    func performBackgroundNetworkTask() {
        debugPrint("perform Background Network Task")
    }
}
/// Because the instance is an actor, all interactions with it must be asynchronous. You use await to access properties and call methods, which allows Swift to safely queue tasks if multiple threads try to access the singleton simultaneously.

func fetchUserData() async {
    // Accessing the singleton requires 'await'
    await MyActor.shared.performBackgroundNetworkTask()
}

Task { await fetchUserData() }
