//
//  MainView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var router: MainRouter
    @StateObject private var storiesViewModel = StoryViewModel()
    
    @State private var fromStationId: UUID?
    @State private var toStationId: UUID?
    
    var body: some View {
        VStack(spacing: 16) {
            StoriesBlockView().environmentObject(storiesViewModel)
            
            RouteView(
                fromStationId: $fromStationId,
                toStationId: $toStationId
            )
            
            if fromStationId != nil && toStationId != nil {
                findButton
            }
            
            Spacer()
            
            Divider()
        }
        .background(.c6White)
    }
    
    private var findButton: some View {
        Button(
            action: {
                router.push(.selectCarrier)
            },
            label: {
                Text("Найти")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 150)
            }
        )
        .buttonStyle(.blueRoundedButton)
    }
}

#Preview {
    MainView()
}
