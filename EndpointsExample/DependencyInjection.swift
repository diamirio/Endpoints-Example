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
        
        let customizedHttpBinClient = CustomizedHTTPBinClient()
        
        let api = ExampleAPI(
            postmanClient: postmanClient,
            httpBinClient: httpBinClient,
            customizedHttpBinClient: customizedHttpBinClient,
        )
        
        DependencyInjector.register(api, as: API.self)
    }
}
