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
    func models() async throws -> Components.Schemas.ModelsResponse {
        let response = try await client.getModels(Operations.getModels.Input())
        switch response {
        case .ok(let okResponse):
          switch okResponse.body {
          case .json(let modelResponse):
            return modelResponse
          }
        case .undocumented(statusCode: let statusCode, _):
          throw URLError(URLError.Code(rawValue: statusCode))
        }
    }
}
