@testable import CoreOpenAI
import XCTest

final class ModelsTests: XCTestCase {
    let client = OpenAI(client: OpenAPIMock())
    
    func testGetModlesResponseSuccess() async throws {
        let modelsResponse = try await client.models()
        XCTAssertEqual(modelsResponse.object, "list")
        XCTAssertEqual(modelsResponse.data.count, 64)
    }
    
    func testGetModelSuccess() async throws {
        let model = try await client.retrieve(model: "gpt-3.5-turbo-0301")
        XCTAssertEqual(model.object, "model")
        XCTAssertEqual(model.id, "gpt-3.5-turbo-0301")
    }
}
