import Endpoints
import Foundation


enum PostmanEchoClient {
    struct ExampleGetCall: Call {
        typealias Parser = JSONParser<ExampleModel>

        var request: URLRequestEncodable {
            Request(.get, "/get")
        }
    }
}
