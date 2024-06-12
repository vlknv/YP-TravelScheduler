//
//  Contact.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import Foundation

enum Contact {
    case email(String)
    case phone(String)
    
    var name: String {
        switch self {
        case .email: "E-mail"
        case .phone: "Телефон"
        }
    }
    
    var content: String {
        switch self {
        case .email(let content), .phone(let content): content
        }
    }
}
