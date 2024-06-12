//
//  ProgressBarView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import SwiftUI

struct ProgressView<ViewModel: ProgressViewModelProtocol> {
    @ObservedObject private var viewModel: ViewModel
    
    @State private var isAnimating = false
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

extension ProgressView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(.white)
            
            Capsule()
                .foregroundColor(viewModel.state.color)
                .scaleEffect(x: isAnimating ? 1 : 0, y: 1, anchor: .leading)
                .animation(viewModel.state.animation, value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
        }
        .frame(height: 6)
    }
}

private extension ProgressState {
    var animation: Animation? {
        switch self {
        case .empty, .filled: nil
        case .isFilling(let duration): .linear(duration: duration)
        }
    }
    
    var color: Color {
        switch self {
        case .empty: .white
        case .isFilling, .filled: .accent
        }
    }
}
