//
//  Counter.swift
//  Ta11y
//
//  Created by Ярослав on 20.02.2024.
//

import Foundation
import SwiftData

@Model
final class Counter {
    var created: Date = Date()
    var lastUpdated: Date = Date()
    var title: String = ""
    var subtitle: String = ""
    var value: Int = 0
    var negativeValues: Bool = true
    var resetEveryDay: Bool = true
    
    init(
        created: Date = Date(),
        lastUpdated: Date = Date(),
        title: String = "",
        subtitle: String = "",
        value: Int = 0,
        negativeValues: Bool = true,
        resetEveryDay: Bool = true
    ) {
        self.created = created
        self.lastUpdated = lastUpdated
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.negativeValues = negativeValues
        self.resetEveryDay = resetEveryDay
    }
}
