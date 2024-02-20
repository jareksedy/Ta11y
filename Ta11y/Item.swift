//
//  Item.swift
//  Ta11y
//
//  Created by Ярослав on 20.02.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
