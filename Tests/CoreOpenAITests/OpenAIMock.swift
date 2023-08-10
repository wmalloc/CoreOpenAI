//
//  OpenAIMock.swift
//
//  Created by Waqar Malik on 6/16/23.
//

@testable import CoreOpenAI
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

struct OpenAIMock: APIProtocol {
    static func createResponse<ResponseType: Decodable>(name: String) throws -> ResponseType {
        let data = try Bundle.module.data(forResource: name)
        let modelResponse = try JSONDecoder().decode(ResponseType.self, from: data)
        return modelResponse
    }
    
    func listEngines(_ input: CoreOpenAI.Operations.listEngines.Input) async throws -> CoreOpenAI.Operations.listEngines.Output {
        let response: Components.Schemas.ListEnginesResponse = try Self.createResponse(name: "ModelResponseSuccess")
        return .ok(Operations.listEngines.Output.Ok(body: .json(response)))
    }
    
    func retrieveEngine(_ input: CoreOpenAI.Operations.retrieveEngine.Input) async throws -> CoreOpenAI.Operations.retrieveEngine.Output {
        let response: Components.Schemas.Engine = try Self.createResponse(name: "ModelSuccess")
        return .ok(Operations.retrieveEngine.Output.Ok(body: .json(response)))
    }
    
    func createChatCompletion(_ input: CoreOpenAI.Operations.createChatCompletion.Input) async throws -> CoreOpenAI.Operations.createChatCompletion.Output {
        let response: Components.Schemas.CreateChatCompletionResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createChatCompletion.Output.Ok(body: .json(response)))
    }
    
    func createCompletion(_ input: CoreOpenAI.Operations.createCompletion.Input) async throws -> CoreOpenAI.Operations.createCompletion.Output {
        let response: Components.Schemas.CreateCompletionResponse = try Self.createResponse(name: "CompletionsResponse")
        return .ok(Operations.createCompletion.Output.Ok(body: .json(response)))
    }
    
    func createEdit(_ input: CoreOpenAI.Operations.createEdit.Input) async throws -> CoreOpenAI.Operations.createEdit.Output {
        let response: Components.Schemas.CreateEditResponse = try Self.createResponse(name: "EditResponse")
        return .ok(Operations.createEdit.Output.Ok(body: .json(response)))
    }
    
    func createImage(_ input: CoreOpenAI.Operations.createImage.Input) async throws -> CoreOpenAI.Operations.createImage.Output {
        let response: Components.Schemas.ImagesResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createImage.Output.Ok(body: .json(response)))
    }
    
    func createImageEdit(_ input: CoreOpenAI.Operations.createImageEdit.Input) async throws -> CoreOpenAI.Operations.createImageEdit.Output {
        let response: Components.Schemas.ImagesResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createImageEdit.Output.Ok(body: .json(response)))
    }
    
    func createImageVariation(_ input: CoreOpenAI.Operations.createImageVariation.Input) async throws -> CoreOpenAI.Operations.createImageVariation.Output {
        let response: Components.Schemas.ImagesResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createImageVariation.Output.Ok(body: .json(response)))
    }
    
    func createEmbedding(_ input: CoreOpenAI.Operations.createEmbedding.Input) async throws -> CoreOpenAI.Operations.createEmbedding.Output {
        let response: Components.Schemas.CreateEmbeddingResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createEmbedding.Output.Ok(body: .json(response)))
    }
    
    func createTranscription(_ input: CoreOpenAI.Operations.createTranscription.Input) async throws -> CoreOpenAI.Operations.createTranscription.Output {
        let response: Components.Schemas.CreateTranscriptionResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createTranscription.Output.Ok(body: .json(response)))
    }
    
    func createTranslation(_ input: CoreOpenAI.Operations.createTranslation.Input) async throws -> CoreOpenAI.Operations.createTranslation.Output {
        let response: Components.Schemas.CreateTranslationResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createTranslation.Output.Ok(body: .json(response)))
    }
    
    func createSearch(_ input: CoreOpenAI.Operations.createSearch.Input) async throws -> CoreOpenAI.Operations.createSearch.Output {
        let response: Components.Schemas.CreateSearchResponse = try Self.createResponse(name: "ChatCompletionsResponse")
         return .ok(Operations.createSearch.Output.Ok(body: .json(response)))
    }
    
    func listFiles(_ input: CoreOpenAI.Operations.listFiles.Input) async throws -> CoreOpenAI.Operations.listFiles.Output {
        let response: Components.Schemas.ListFilesResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.listFiles.Output.Ok(body: .json(response)))
   }
    
    func createFile(_ input: CoreOpenAI.Operations.createFile.Input) async throws -> CoreOpenAI.Operations.createFile.Output {
        let response: Components.Schemas.OpenAIFile = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createFile.Output.Ok(body: .json(response)))
    }
    
    func retrieveFile(_ input: CoreOpenAI.Operations.retrieveFile.Input) async throws -> CoreOpenAI.Operations.retrieveFile.Output {
        let response: Components.Schemas.OpenAIFile = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.retrieveFile.Output.Ok(body: .json(response)))
    }
    
    func deleteFile(_ input: CoreOpenAI.Operations.deleteFile.Input) async throws -> CoreOpenAI.Operations.deleteFile.Output {
        let response: Components.Schemas.DeleteFileResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.deleteFile.Output.Ok(body: .json(response)))
    }
    
    func downloadFile(_ input: CoreOpenAI.Operations.downloadFile.Input) async throws -> CoreOpenAI.Operations.downloadFile.Output {
        let response: String = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.downloadFile.Output.Ok(body: .json(response)))
    }
    
    func createAnswer(_ input: CoreOpenAI.Operations.createAnswer.Input) async throws -> CoreOpenAI.Operations.createAnswer.Output {
        let response: Components.Schemas.CreateAnswerResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createAnswer.Output.Ok(body: .json(response)))
    }
    
    func createClassification(_ input: CoreOpenAI.Operations.createClassification.Input) async throws -> CoreOpenAI.Operations.createClassification.Output {
        let response: Components.Schemas.CreateClassificationResponse = try Self.createResponse(name: "ChatCompletionsResponse")
         return .ok(Operations.createClassification.Output.Ok(body: .json(response)))
    }
    
    func listFineTunes(_ input: CoreOpenAI.Operations.listFineTunes.Input) async throws -> CoreOpenAI.Operations.listFineTunes.Output {
        let response: Components.Schemas.ListFineTunesResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.listFineTunes.Output.Ok(body: .json(response)))
    }
    
    func createFineTune(_ input: CoreOpenAI.Operations.createFineTune.Input) async throws -> CoreOpenAI.Operations.createFineTune.Output {
        let response: Components.Schemas.FineTune = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createFineTune.Output.Ok(body: .json(response)))
    }
    
    func retrieveFineTune(_ input: CoreOpenAI.Operations.retrieveFineTune.Input) async throws -> CoreOpenAI.Operations.retrieveFineTune.Output {
        let response: Components.Schemas.FineTune = try Self.createResponse(name: "ChatCompletionsResponse")
         return .ok(Operations.retrieveFineTune.Output.Ok(body: .json(response)))
    }
    
    func cancelFineTune(_ input: CoreOpenAI.Operations.cancelFineTune.Input) async throws -> CoreOpenAI.Operations.cancelFineTune.Output {
        let response: Components.Schemas.FineTune = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.cancelFineTune.Output.Ok(body: .json(response)))
    }
    
    func listFineTuneEvents(_ input: CoreOpenAI.Operations.listFineTuneEvents.Input) async throws -> CoreOpenAI.Operations.listFineTuneEvents.Output {
        let response: Components.Schemas.ListFineTuneEventsResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.listFineTuneEvents.Output.Ok(body: .json(response)))
    }
    
    func listModels(_ input: CoreOpenAI.Operations.listModels.Input) async throws -> CoreOpenAI.Operations.listModels.Output {
        let response: Components.Schemas.ListModelsResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.listModels.Output.Ok(body: .json(response)))
    }
    
    func retrieveModel(_ input: CoreOpenAI.Operations.retrieveModel.Input) async throws -> CoreOpenAI.Operations.retrieveModel.Output {
        let response: Components.Schemas.Model = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.retrieveModel.Output.Ok(body: .json(response)))
    }
    
    func deleteModel(_ input: CoreOpenAI.Operations.deleteModel.Input) async throws -> CoreOpenAI.Operations.deleteModel.Output {
        let response: Components.Schemas.DeleteModelResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.deleteModel.Output.Ok(body: .json(response)))
    }
    
    func createModeration(_ input: CoreOpenAI.Operations.createModeration.Input) async throws -> CoreOpenAI.Operations.createModeration.Output {
        let response: Components.Schemas.CreateModerationResponse = try Self.createResponse(name: "ChatCompletionsResponse")
        return .ok(Operations.createModeration.Output.Ok(body: .json(response)))
    }
}
