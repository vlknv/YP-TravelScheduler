//
//  YPTravelSchedulerApp.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 02.03.2024.
//

import SwiftUI

@main
struct YPTravelSchedulerApp: App {
    @State var darkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainTabView(darkMode: $darkMode)
                .preferredColorScheme(darkMode ? .dark : .light)
                .accentColor(.primary)
        }
    }
}
