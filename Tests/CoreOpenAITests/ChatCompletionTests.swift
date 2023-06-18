//
//  ChatCompletionTests.swift
//
//  Created by Waqar Malik on 5/8/23.
//

@testable import CoreOpenAI
import XCTest

final class ChatCompletionTests: XCTestCase {
    let client = OpenAI(client: OpenAPIMock())

    func testChatCompletion() async throws {
        let response = try await client.createChatCompletions(model: "gpt-3.5-turbo-0301", message: "Hello")
        XCTAssertEqual(response.object, "chat.completion")
        XCTAssertEqual(response.id, "chatcmpl-12")
    }
}
