//
//  OpenAI+Model.swift
//
//  Created by Waqar Malik on 7/5/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public extension OpenAI {
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
    
    func retrieve(model name: String) async throws -> Components.Schemas.Model {
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
    
    func delete(model name: String) async throws -> Components.Schemas.DeleteModelResponse {
        let response = try await client.deleteModel(.init(path: .init(model: name)))
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
    
