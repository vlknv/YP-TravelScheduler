//
//  ButtonStyle+blueRoundedButton.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import SwiftUI

extension ButtonStyle where Self == BlueRoundedButton {
    static var blueRoundedButton: Self { BlueRoundedButton() }
}

struct BlueRoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .padding(.vertical, 20)
            .background(.accent)
            .clipShape(.rect(cornerRadius: 16))
            .opacity(configuration.isPressed ? 0.3 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
