//
//  Symbol.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import SwiftUI

enum Symbol: String {
    case chevronForward = "chevron.forward"
    case chevronBackward = "chevron.backward"
    case magnifyingglass
    case xmarkCircleFill = "xmark.circle.fill"
    case arrowForward = "arrow.forward"
    case xmark
}

extension Symbol {
    var image: Image {
        Image(systemName: rawValue)
    }
}
