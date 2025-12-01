// Copyright © 2025 DIAMIR. All Rights Reserved.

import AsyncReactor
import SwiftUI

struct ExampleReactorView: View {
    
    @EnvironmentObject
    private var reactor: ExampleReactor

    var body: some View {
        VStack {
            if reactor.state.text.isEmpty {
                ProgressView()
            } else {
                Text(reactor.state.text)
                    .font(.headline)
            }
        }
        .task {
            await reactor.action(.executeRequest)
        }
    }
}

#Preview {
    ReactorView(ExampleReactor()) {
        ExampleReactorView()
    }
}
