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
    func getModel(_ input: Operations.getModel.Input) async throws -> Operations.getModel.Output {
        let data = try Bundle.module.data(forResource: "ModelSuccess")
        let model = try JSONDecoder().decode(Components.Schemas.Model.self, from: data)
        return .ok(Operations.getModel.Output.Ok(body: .json(model)))
    }
    
    func getModels(_ input: Operations.getModels.Input) async throws -> Operations.getModels.Output {
        let data = try Bundle.module.data(forResource: "ModelResponseSuccess")
        let modelResponse = try JSONDecoder().decode(Components.Schemas.ModelsResponse.self, from: data)
        return .ok(Operations.getModels.Output.Ok(body: .json(modelResponse)))
    }
    
//    func getModels(_ input: Operations.getModels.Input) async throws -> Components.Schemas.ModelsResponse {
//        let response = try await client.getModels(Operations.getModels.Input())
//        switch response {
//        case .ok(let okResponse):
//            switch okResponse.body {
//            case .json(let modelResponse):
//                return modelResponse
//            }
//        case .undocumented(statusCode: let statusCode, _):
//            throw URLError(URLError.Code(rawValue: statusCode))
//        }
//    }
}
