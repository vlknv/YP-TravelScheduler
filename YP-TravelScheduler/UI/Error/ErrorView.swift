//
//  ErrorView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.dismiss)
    var dismiss
    
    let errorType: NetworkError
    
    var body: some View {
        VStack(spacing: 16) {
            Image(errorType.image)
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(.rect(cornerRadius: 70))
            
            Text(errorType.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.c7Black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.c6White)
        .overlay(alignment: .topLeading) {
            // Кнопка пока что добавлена для тестирования,
            // потому что иначе скрыть экран сейчас нельзя
            Button(
                action: {
                    dismiss()
                },
                label: {
                    Symbol.xmark.image
                        .tint(.c7Black)
                }
            )
            .padding(16)
        }
    }
}

#Preview {
    ErrorView(errorType: .noInternet)
}

private extension NetworkError {
    var image: ImageResource {
        switch self {
        case .noInternet: .planet
        case .serverUnavailable: .pc
        }
    }
    
    var title: String {
        switch self {
        case .noInternet: "Нет интернета"
        case .serverUnavailable: "Ошибка сервера"
        }
    }
}
