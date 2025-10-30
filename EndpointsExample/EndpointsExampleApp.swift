// Copyright © 2025 DIAMIR. All Rights Reserved.

import AsyncReactor
import SwiftUI

@main
struct EndpointsExampleApp: App {
    init() {
        DependencyInjection.register()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List {
                    Section {
                        NavigationLink("MVVM", destination: ExampleView())
                        NavigationLink("AsyncReactor", destination: ReactorView(ExampleReactor()) {
                            ExampleReactorView()
                        })
                    }
                }
            }
        }
    }
}
