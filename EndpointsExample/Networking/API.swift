//
//  API.swift
//  EndpointsTestbed
//
//  Created by Alexander Kauer on 11.09.25.
//

import Endpoints
import Foundation

protocol API: Actor {
    func loadExampleData() async throws -> (ExampleModel, HTTPURLResponse)
    func loadManipulatedData(deliveredStatusCode: Int) async throws -> (String, HTTPURLResponse)
}

actor ExampleAPI: API {
    var postmanSession: Session<AnyClient>
    var httpBinSession: Session<AnyClient>
    var manipulatedHttpBinSession: Session<ManipulatedHTTPBinClient>

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
