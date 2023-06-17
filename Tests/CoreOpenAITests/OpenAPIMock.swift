//
//  OpenAIMock.swift
//
//  Created by Waqar Malik on 6/16/23.
//

@testable import CoreOpenAI
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

struct OpenAPIMock: APIProtocol {
     func getModels(_ input: Operations.getModels.Input) async throws -> Operations.getModels.Output {
        let data = try Bundle.module.data(forResource: "ModelResponseSuccess")
        let modelResponse = try JSONDecoder().decode(Components.Schemas.ModelsResponse.self, from: data)
        return .ok(Operations.getModels.Output.Ok(body: .json(modelResponse)))
    }
    
    func getModel(_ input: Operations.getModel.Input) async throws -> Operations.getModel.Output {
        let data = try Bundle.module.data(forResource: "ModelSuccess")
        let model = try JSONDecoder().decode(Components.Schemas.Model.self, from: data)
        return .ok(Operations.getModel.Output.Ok(body: .json(model)))
    }
    
    func chatCompletions(_ input: CoreOpenAI.Operations.chatCompletions.Input) async throws -> CoreOpenAI.Operations.chatCompletions.Output {
        let data = try Bundle.module.data(forResource: "ChatCompletionsResponse")
        let response = try JSONDecoder().decode(Components.Schemas.ChatCompletionResponse.self, from: data)
        return .ok(Operations.chatCompletions.Output.Ok(body: .json(response)))}
}
