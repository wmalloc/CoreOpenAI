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
        let request: Components.Schemas.CreateChatCompletionRequest = try OpenAPIMock.createResponse(name: "ChatCompletionsParameters")
        let response = try await client.createChat(completion: request)
        XCTAssertEqual(response.object, "chat.completion")
        XCTAssertEqual(response.id, "chatcmpl-12")
    }
}
