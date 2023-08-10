//
//  OpenAI+Chat.swift
//
//  Created by Waqar Malik on 7/5/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public extension OpenAI {
    func createChat(completion: Components.Schemas.CreateChatCompletionRequest) async throws -> Components.Schemas.CreateChatCompletionResponse {
        let response = try await client.createChatCompletion(.init(body: .json(completion)))
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
