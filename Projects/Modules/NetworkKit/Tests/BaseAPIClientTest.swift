import Foundation
import XCTest

import NetworkKit
import NetworkKitTesting

class BaseAPIClientTest: XCTestCase {
    func test_request() async throws {
        let expectation = XCTestExpectation()
        let apiClient: BaseAPIClient = .init()
        let testBundle = Bundle(for: BaseAPIClientTest.self)
        let testFactAPIKey: String = testBundle.object(forInfoDictionaryKey: "TEST_FACT_API_KEY") as? String ?? "없음"
        let (response, error): ([Fact]?, Error?) = try await apiClient.requestJSON(
            "https://api.api-ninjas.com/v1/facts",
            type: [Fact].self,
            method: .get,
            parameters: ["limit": 10],
            headers: ["X-Api-Key": testFactAPIKey]
        )
        print("🚧 testFactAPIKey: \(testFactAPIKey)")
        if let error {
            print(error)
            XCTAssert(false)
        } else if let response {
            response.forEach {
                print("👉 \($0.fact)")
            }
        }
        expectation.fulfill()
    }
}
