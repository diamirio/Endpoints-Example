// Copyright © 2025 DIAMIR. All Rights Reserved.

import Endpoints
import Foundation

protocol API: Actor {
    func loadExampleData() async throws -> (ExampleModel, HTTPURLResponse)
    func loadCustomizedData(deliveredStatusCode: Int) async throws -> (String, HTTPURLResponse)
}

actor ExampleAPI: API {
    private let postmanSession: Session<DefaultClient>
    private let httpBinSession: Session<DefaultClient>
    private let customizedHttpBinSession: Session<CustomizedHTTPBinClient>

    init(
        postmanClient: DefaultClient,
        httpBinClient: DefaultClient,
        customizedHttpBinSession: CustomizedHTTPBinClient,
    ) {
        self.postmanSession = Session(with: postmanClient)
        self.httpBinSession = Session(with: httpBinClient)
        self.customizedHttpBinSession = Session(with: customizedHttpBinSession)
    }

    func loadExampleData() async throws -> (ExampleModel, HTTPURLResponse) {
        try await postmanSession.dataTask(
            for: PostmanEchoClient.ExampleGetCall()
        )
    }
    
    func loadCustomizedData(deliveredStatusCode: Int) async throws -> (String, HTTPURLResponse) {
        try await customizedHttpBinSession.dataTask(
            for: CustomizedHTTPBinClient.GetStatusCode(deliveredStatusCode: deliveredStatusCode)
        )
    }
}
