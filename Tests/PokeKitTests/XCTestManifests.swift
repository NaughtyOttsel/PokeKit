@testable import PokeKit
import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(PokeKitTests.allTests),
        ]
    }
#endif
