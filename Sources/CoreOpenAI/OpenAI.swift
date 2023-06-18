//
//  OpenAI.swift
//
//  Created by Waqar Malik on 6/16/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

open class OpenAI<ClientType: APIProtocol> {
    public let client: ClientType

    public init(client: ClientType) {
        self.client = client
    }

    public init(sessionConfiguration: URLSessionConfiguration = .default) where ClientType == Client {
        self.client = Client(serverURL: try! Servers.server1(), transport: URLSessionTransport(configuration: .init(session: URLSession(configuration: sessionConfiguration))))
    }
}

public extension OpenAI {

    //@AddCompletionHandler(parameterName: "completion")
    func engines() async throws -> Components.Schemas.ListEnginesResponse {
        let response = try await client.listEngines(.init())
        switch response {
        case .ok(let okResponse):
          switch okResponse.body {
          case .json(let listEngineResponse):
            return listEngineResponse
          }
        case .undocumented(statusCode: let statusCode, _):
          throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
    
    func retrieveEngine(engine_id: String) async throws -> Components.Schemas.Engine {
        let response = try await client.retrieveEngine(.init(path: .init(engine_id: engine_id)))
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let model):
                return model
            }
        case .undocumented(statusCode: let statusCode, _):
            throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
    
    func models() async throws -> Components.Schemas.ListModelsResponse {
        let response = try await client.listModels(.init())
        switch response {
        case .ok(let okResponse):
          switch okResponse.body {
          case .json(let listModelResponse):
            return listModelResponse
          }
        case .undocumented(statusCode: let statusCode, _):
          throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
    
    func retrieveModel(name: String) async throws -> Components.Schemas.Model {
        let response = try await client.retrieveModel(.init(path: .init(model: name)))
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let model):
                return model
            }
        case .undocumented(statusCode: let statusCode, _):
            throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
}
    
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
