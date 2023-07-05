//
//  OpenAI+Chat.swift
//
//  Created by Waqar Malik on 7/5/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public extension OpenAI {
    func createChatCompletions(model: String, message: String) async throws -> Components.Schemas.CreateChatCompletionResponse {
        let body = Components.Schemas.CreateChatCompletionRequest(model: model, messages: [Components.Schemas.ChatCompletionRequestMessage(role: .user, content: message)])
        let response = try await client.createChatCompletion(.init(body: .json(body)))
        switch response {
        case .ok(let okResponse):
          switch okResponse.body {
          case .json(let chatResponse):
            return chatResponse
          }
        case .undocumented(statusCode: let statusCode, _):
          throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
}
