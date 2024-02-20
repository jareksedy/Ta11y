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
    var timestamp: Date = Date()
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
