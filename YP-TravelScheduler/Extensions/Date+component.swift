//
//  Date+component.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import Foundation

public extension Date {
    func component(
        _ component: Calendar.Component,
        using calendar: Calendar = .autoupdatingCurrent
    ) -> Int {
        calendar.component(component, from: self)
    }
}
