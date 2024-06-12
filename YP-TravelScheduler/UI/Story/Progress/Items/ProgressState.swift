//
//  ProgressState.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import Foundation

enum ProgressState {
    case empty
    case filled
    case isFilling(duration: TimeInterval)
}
