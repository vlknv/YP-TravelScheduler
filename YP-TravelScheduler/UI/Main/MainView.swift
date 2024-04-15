//
//  MainView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var storiesViewModel = StoryViewModel()
    
    @State private var fromStationId: UUID?
    @State private var toStationId: UUID?
    
    var body: some View {
        VStack(spacing: 16) {
            StoriesBlockView().environmentObject(storiesViewModel)
            
            RouteView(fromStationId: $fromStationId, toStationId: $toStationId)
            
            if fromStationId != nil && toStationId != nil {
                NavigationLink(destination: SelectCarrierView()) {
                    Text("Найти")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 150)
                }
                .buttonStyle(.blueRoundedButton)
            }
            
            Spacer()
            
            Divider()
        }
        .background(.c6White)
    }
}

#Preview {
    MainView()
}
