//
//  SettingsRouter.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

final class SettingsRouter: RouterProtocol {
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func view(for destination: SettingsDestination) -> some View {
        switch destination {
        case .userAgreement:
            WebView()
                .background(.c6White)
                .customToolbar(title: "Пользовательское соглашение", router: self)
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
