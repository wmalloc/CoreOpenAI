//
//  OpenAI+Engine.swift
//
//  Created by Waqar Malik on 7/5/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

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
    
    func retrieveEngine(engineId: String) async throws -> Components.Schemas.Engine {
        let response = try await client.retrieveEngine(.init(path: .init(engine_id: engineId)))
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
