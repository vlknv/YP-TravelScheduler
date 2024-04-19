//
//  MainTabView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var error: NetworkError?

    @Binding var darkMode: Bool
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(.message)
                }
            
            SettingsView(
                darkMode: $darkMode,
                error: $error
            )
            .tabItem {
                Image(.gear)
            }
        }
        .fullScreenCover(item: $error) {
            ErrorView(errorType: $0)
        }
    }
}

#Preview {
    MainTabView(darkMode: .constant(false))
}
