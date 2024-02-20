//
//  Ta11yApp.swift
//  Ta11y
//
//  Created by Ярослав on 20.02.2024.
//

import SwiftUI
import SwiftData

@main
struct Ta11yApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Counter.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CountersView()
        }
        .modelContainer(sharedModelContainer)
    }
}
