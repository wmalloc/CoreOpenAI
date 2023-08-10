//
//  OpenAI+Model.swift
//
//  Created by Waqar Malik on 7/5/23.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public extension OpenAI {
    func models(input: Operations.listModels.Input = .init()) async throws -> Components.Schemas.ListModelsResponse {
        let response = try await client.listModels(input)
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
    
    func retrieve(model: Operations.retrieveModel.Input) async throws -> Components.Schemas.Model {
        let response = try await client.retrieveModel(model)
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
    
    func delete(model: Operations.deleteModel.Input) async throws -> Components.Schemas.DeleteModelResponse {
        let response = try await client.deleteModel(model)
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
    
