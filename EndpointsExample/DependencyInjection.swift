// Copyright © 2025 DIAMIR. All Rights Reserved.

import Endpoints
import Foundation
import Injection

@MainActor
enum DependencyInjection {
    static func register() {
        let postmanEchoUrl = URL(string: "https://postman-echo.com")!
        let postmanClient = DefaultClient(url: postmanEchoUrl)
        
        let httpBinUrl = URL(string: "https://httpbin.org/")!
        let httpBinClient = DefaultClient(url: httpBinUrl)
        
        let customizedHttpBinSession = CustomizedHTTPBinClient()
        
        let api = ExampleAPI(
            postmanClient: postmanClient,
            httpBinClient: httpBinClient,
            customizedHttpBinSession: customizedHttpBinSession,
        )
        
        DependencyInjector.register(api, as: API.self)
    }
}
