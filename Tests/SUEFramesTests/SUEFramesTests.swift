import XCTest
@testable import SUEFrames

final class SUEFramesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SUEFrames().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
