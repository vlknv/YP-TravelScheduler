//
//  DateComponentsFormatter.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import Foundation

extension DateComponentsFormatter {
    static let hours: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour]
        return formatter
    }()
    
    static let hoursAndMinutes: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
}
