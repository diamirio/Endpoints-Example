// Copyright © 2025 DIAMIR. All Rights Reserved.

import Endpoints
import Foundation

protocol API: Actor {
    func loadExampleData() async throws -> (ExampleModel, HTTPURLResponse)
    func loadManipulatedData(deliveredStatusCode: Int) async throws -> (String, HTTPURLResponse)
}

actor ExampleAPI: API {
    private let postmanSession: Session<AnyClient>
    private let httpBinSession: Session<AnyClient>
    private let manipulatedHttpBinSession: Session<ManipulatedHTTPBinClient>

    init(
        postmanClient: AnyClient,
        httpBinClient: AnyClient,
        manipulatedHttpBinClient: ManipulatedHTTPBinClient,
    ) {
        self.postmanSession = Session(with: postmanClient)
        self.httpBinSession = Session(with: httpBinClient)
        self.manipulatedHttpBinSession = Session(with: manipulatedHttpBinClient)
    }

    func loadExampleData() async throws -> (ExampleModel, HTTPURLResponse) {
        try await postmanSession.dataTask(
            for: PostmanEchoClient.ExampleGetCall()
        )
    }
    
    func loadManipulatedData(deliveredStatusCode: Int) async throws -> (String, HTTPURLResponse) {
        try await manipulatedHttpBinSession.dataTask(
            for: ManipulatedHTTPBinClient.GetStatusCode(deliveredStatusCode: deliveredStatusCode)
        )
    }
}
