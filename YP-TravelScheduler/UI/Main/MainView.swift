//
//  MainView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var storiesViewModel = StoryViewModel()
    
    @State private var path: [MainDestination] = []

    @State private var fromStationId: UUID?
    @State private var toStationId: UUID?
    
    var body: some View {
        NavigationStack(path: $path) {
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
            .navigationDestination(for: MainDestination.self) { destination in
                switch destination {
                case .route(let parameters):
                    SelectSubjectView(
                        subject: parameters.subject,
                        path: $path,
                        selectedSubjectId: parameters.selectedId
                    )
                    
                case .selectCarrier:
                    SelectCarrierView()
                    
                case .carrierInfo(let carrier):
                    CarrierInfoView(carrier: carrier)
                    
                case .routesFilter(let parameters):
                    RoutesFilterView(
                        selectedRouteIntervals: parameters.selectedRouteIntervals,
                        transferVariant: parameters.transferVariant
                    )
                }
            }
        }
    }
    
    private var findButton: some View {
        NavigationLink(value: MainDestination.selectCarrier) {
            Text("Найти")
                .font(.system(size: 17, weight: .bold))
                .frame(width: 150)
        }
        .buttonStyle(.blueRoundedButton)
    }
}

#Preview {
    MainView()
}
