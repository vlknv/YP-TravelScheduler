//
//  Collection+elementOrNil.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 08.04.2024.
//

import Foundation

extension Collection {
    func elementOrNil(at index: Index) -> Element? {
        guard indices.contains(index) else {
            return nil
        }
        
        return self[index]
    }
}
