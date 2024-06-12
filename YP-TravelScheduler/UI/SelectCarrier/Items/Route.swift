//
//  Route.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import Foundation

struct Route: Identifiable {
    let id: UUID
    
    let startPoint: Point
    let finishPoint: Point
    let variants: [Variant]
}

extension Route {
    struct Point: Identifiable {
        let id: UUID
        
        let title: String
    }
    
    struct Variant: Identifiable {
        let id: UUID
        
        let carrier: Carrier
        let startDate: Date
        let finishDate: Date
        let transferPoint: Point?
        
        init(
            id: UUID,
            carrier: Carrier,
            startDate: Date,
            finishDate: Date,
            transferPoint: Point? = nil
        ) {
            self.id = id
            self.carrier = carrier
            self.startDate = startDate
            self.finishDate = finishDate
            self.transferPoint = transferPoint
        }
    }
}

extension Route.Variant {
    var startDateFormatted: String {
        DateFormatter.shortDate.string(from: startDate)
    }
    
    var startTimeFormatted: String {
        DateFormatter.time.string(from: startDate)
    }
    
    var finishTimeFormatted: String {
        DateFormatter.time.string(from: finishDate)
    }
    
    var durationFormatted: String? {
        DateComponentsFormatter.hours.string(from: startDate, to: finishDate)
    }
}

extension Route {
    static let mockRoute: Self =
        .init(
            id: UUID(),
            startPoint: .init(id: UUID(), title: "Москва (Ярославский вокзал)"),
            finishPoint: .init(id: UUID(), title: "Санкт Петербург (Балтийский вокзал)"),
            variants: [
                .init(
                    id: UUID(),
                    carrier: .rzd,
                    startDate: .now,
                    finishDate: .now.addingTimeInterval(5.0 * 3600),
                    transferPoint: .init(id: UUID(), title: "Костроме")
                ),
                .init(
                    id: UUID(),
                    carrier: .fgk,
                    startDate: .now.addingTimeInterval(5.1 * 3600),
                    finishDate: .now.addingTimeInterval(8.2 * 3600)
                ),
                .init(
                    id: UUID(),
                    carrier: .rzd,
                    startDate: .now.addingTimeInterval(8.2 * 3600),
                    finishDate: .now.addingTimeInterval(10.8 * 3600),
                    transferPoint: .init(id: UUID(), title: "Костроме")
                ),
                .init(
                    id: UUID(),
                    carrier: .ural,
                    startDate: .now.addingTimeInterval(12.6 * 3600),
                    finishDate: .now.addingTimeInterval(15.5 * 3600)
                ),
            ]
        )
}
