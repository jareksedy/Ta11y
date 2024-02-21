//
//  Counter.swift
//  Ta11y
//
//  Created by Ярослав on 20.02.2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Counter {
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var title: String = ""
    var value: Int = 0
    var shouldResetDaily: Bool = true
    var backgroundColor: Color
    
    init(
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        title: String = "",
        subtitle: String? = nil,
        value: Int = 0,
        allowNegativeValues: Bool = true,
        shouldResetDaily: Bool = true,
        backgroundColor: Color = .accentColor
        
    ) {
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.title = title
        self.value = value
        self.shouldResetDaily = shouldResetDaily
        self.backgroundColor = backgroundColor
    }
}
