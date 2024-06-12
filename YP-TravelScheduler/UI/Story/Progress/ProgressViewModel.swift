//
//  ProgressViewModel.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import Foundation

protocol ProgressViewModelProtocol: ObservableObject {
    var state: ProgressState { get }
}

final class ProgressViewModel: ProgressViewModelProtocol, Identifiable {
    let state: ProgressState
    
    init(state: ProgressState) {
        self.state = state
    }
}
