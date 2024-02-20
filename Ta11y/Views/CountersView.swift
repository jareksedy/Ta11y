//
//  ContentView.swift
//  Ta11y
//
//  Created by Ярослав on 20.02.2024.
//

import SwiftUI
import SwiftData

struct CountersView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var counters: [Counter]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(counters) { counter in
                    NavigationLink {
                        Text("Item at \(counter.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(counter.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Ta11y Counter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Counter(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(counters[index])
            }
        }
    }
}

#Preview {
    CountersView()
        .modelContainer(for: Counter.self, inMemory: true)
}