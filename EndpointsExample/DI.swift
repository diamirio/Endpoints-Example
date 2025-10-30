import Endpoints
import Foundation
import Injection

@MainActor
enum DI {
    static func register() {
        let postmanEchoUrl = URL(string: "https://postman-echo.com")!
        let postmanClient = AnyClient(baseURL: postmanEchoUrl)
        
        let httpBinUrl = URL(string: "https://httpbin.org/")!
        let httpBinClient = AnyClient(baseURL: httpBinUrl)
        
        let manipulatedHttpBinSession = ManipulatedHTTPBinClient()
        
        let api = ExampleAPI(
            postmanClient: postmanClient,
            httpBinClient: httpBinClient,
            manipulatedHttpBinClient: manipulatedHttpBinSession
        )
        
        DependencyInjector.register(api, as: API.self)
    }
}
