// Copyright © 2025 DIAMIR. All Rights Reserved.

import Endpoints
import Foundation

enum HTTPBinClient {
    struct GetStatusCode: Call {
        let deliveredStatusCode: Int

        typealias Parser = JSONParser<String>

        var request: URLRequestEncodable {
            Request(.get, "/status/\(deliveredStatusCode)")
        }
    }
}
