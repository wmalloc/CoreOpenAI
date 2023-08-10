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
        let completion = Components.Schemas.CreateChatCompletionRequest(model: "gpt-3.5-turbo-0301", messages: [.init(role: .user, content: "Hello")])
        let response = try await client.createChat(completion: completion)
        XCTAssertEqual(response.object, "chat.completion")
        XCTAssertEqual(response.id, "chatcmpl-12")
    }
}
