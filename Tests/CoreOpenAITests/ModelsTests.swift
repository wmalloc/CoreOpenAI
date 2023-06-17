@testable import CoreOpenAI
import XCTest

final class ModelsTests: XCTestCase {
    let client = OpenAI(client: OpenAPIMock())
    
    func testGetModlesResponseSuccess() async throws {
        let modelsResponse = try await client.models()
        XCTAssertEqual(modelsResponse.object, "list")
        XCTAssertEqual(modelsResponse.data.count, 64)
    }
}
