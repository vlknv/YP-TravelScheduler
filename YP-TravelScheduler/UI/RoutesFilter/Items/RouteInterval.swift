//
//  RouteInterval.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import Foundation

enum RouteInterval: String, CaseIterable {
    case morning = "Утро"
    case day = "День"
    case evening = "Вечер"
    case night = "Ночь"
}

extension RouteInterval {
    var start: DateComponents {
        switch self {
        case .morning: .init(hour: 6)
        case .day: .init(hour: 12)
        case .evening: .init(hour: 18)
        case .night: .init(hour: 0)
        }
    }
    
    var finish: DateComponents {
        switch self {
        case .morning: .init(hour: 12)
        case .day: .init(hour: 18)
        case .evening: .init(hour: 0)
        case .night: .init(hour: 6)
        }
    }
    
    func formattedInterval(using formatter: DateComponentsFormatter) -> String {
        rawValue
        + " "
        + (formatter.string(from: start) ?? "")
        + " - "
        + (formatter.string(from: finish) ?? "")
    }
}
