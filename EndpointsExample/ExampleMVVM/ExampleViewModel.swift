import Endpoints
import Foundation
import Injection

@MainActor
class ExampleViewModel: ObservableObject {
    @Published
    var text: String = ""

    @Inject
    private var api: API

    func executeRequests() {
        Task {
            let (body, response) = try await api.loadExampleData()
            guard response.statusCode == 200 else { return }

            await MainActor.run {
                self.text = body.url
            }
        }

        Task {
            let (_, response) = try await api.loadManipulatedData(deliveredStatusCode: 220)
            guard response.statusCode == 200 else { return }
            print("Success")
        }
    }
}
