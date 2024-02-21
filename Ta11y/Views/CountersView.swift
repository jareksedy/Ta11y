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
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold).rounded(),
            NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold).rounded(),
            NSAttributedString.Key.foregroundColor: UIColor.label
        ]
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(counters) { counter in
                    VStack {
                        Text("\(counter.value)")
                            .id(counter.value)
                            .transition(.push(from: .bottom))
                            .font(.system(size: 124, weight: .bold, design: .rounded))
                            .monospacedDigit()
                            .foregroundStyle(.white)
                        
                        HStack {
                            Button(action: {
                                counter.value += 1
                                counter.updatedAt = Date()
                            },
                                   label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 48, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            })
                            
                            Button(action: {
                                guard counter.value > 0 else { return }
                                counter.value -= 1
                                counter.updatedAt = Date()
                            },
                                   label: {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 48, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                            })

                        }
                        
                    }
                    .padding()
                    .background(.accent)
                    .cornerRadius(12)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
//            .navigationTitle("ta11y app")
//            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.2.square")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                    .padding(.leading, 10)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus.app")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let counter = Counter()
            modelContext.insert(counter)
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

extension UIFont {
    func rounded() -> UIFont {
        guard let descriptor = fontDescriptor.withDesign(.rounded) else {
            return self
        }
        
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
