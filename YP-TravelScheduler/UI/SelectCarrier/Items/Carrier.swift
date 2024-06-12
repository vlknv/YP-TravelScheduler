//
//  Carrier.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import Foundation

struct Carrier: Identifiable, Hashable {
    let id: UUID
    
    let briefTitle: String
    let fullTitle: String
    let miniature: ImageResource
    let logo: ImageResource?
    
    let email: String?
    let phone: String?
    
    init(
        id: UUID,
        briefTitle: String,
        fullTitle: String,
        miniature: ImageResource,
        logo: ImageResource? = nil,
        email: String? = nil,
        phone: String? = nil
    ) {
        self.id = id
        self.briefTitle = briefTitle
        self.fullTitle = fullTitle
        self.miniature = miniature
        self.logo = logo
        self.email = email
        self.phone = phone
    }
}

extension Carrier {
    static let rzd: Self = .init(
        id: UUID(),
        briefTitle: "РЖД",
        fullTitle: "ОАО «РЖД»",
        miniature: .rzdMiniature,
        logo: .rzdFull,
        email: "i.lozgkina@yandex.ru",
        phone: "+7 (904) 329-27-71"
    )
    
    static let fgk: Self = .init(
        id: UUID(),
        briefTitle: "ФГК",
        fullTitle: "ОАО «ФГК»",
        miniature: .fgkMiniature
    )
    
    static let ural: Self = .init(
        id: UUID(),
        briefTitle: "Урал логистика",
        fullTitle: "ОАО «Урал логистика»",
        miniature: .uralMiniature
    )
}
