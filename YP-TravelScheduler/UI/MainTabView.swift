//
//  MainTabView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct MainTabView: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Image(.message)
                    }
                
                SettingsView(darkMode: $darkMode)
                    .tabItem {
                        Image(.gear)
                    }
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    MainTabView(darkMode: .constant(false))
}
