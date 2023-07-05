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
