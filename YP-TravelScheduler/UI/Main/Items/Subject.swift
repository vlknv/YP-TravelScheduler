//
//  Subject.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 12.04.2024.
//

import Foundation

struct Subject: Identifiable, Named {
    let id: UUID
    
    let name: String
    let itemsType: ItemsType?
    let items: [Subject]
}

extension Subject {
    enum ItemsType: String, Hashable {
        case city
        case station
    }
}

extension Subject.ItemsType {
    var title: String {
        switch self {
        case .city: "Выбор города"
        case .station: "Выбор станции"
        }
    }
    
    var notFound: String {
        switch self {
        case .city: "Город не найден"
        case .station: "Станция не найдена"
        }
    }
}

extension Subject {
    func getRouteNameBy(id: UUID) -> String? {
        if self.id == id {
            return name
        }
        
        for subject in items {
            if let result = subject.getRouteNameBy(id: id) {
                if name.isEmpty {
                    return result
                }
                
                return name + " (" + result + ")"
            }
        }
        
        return nil
    }
}

extension Subject {
    static let mockData: Self = .init(
        id: UUID(),
        name: "",
        itemsType: .city,
        items: [
            .init(
                id: UUID(),
                name: "Москва",
                itemsType: .station,
                items: [
                    .init(
                        id: UUID(),
                        name: "Курский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Киевский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Ярославский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Белорусский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                ]
            ),
            .init(
                id: UUID(),
                name: "Санкт-Петербург",
                itemsType: .station,
                items: [
                    .init(
                        id: UUID(),
                        name: "Московский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Финляндский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Ладожский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                    .init(
                        id: UUID(),
                        name: "Витебский вокзал",
                        itemsType: nil,
                        items: []
                    ),
                ]
            ),
            .init(
                id: UUID(),
                name: "Сочи",
                itemsType: .station,
                items: []
            ),
            .init(
                id: UUID(),
                name: "Краснодар",
                itemsType: .station,
                items: []
            ),
        ]
    )
}
