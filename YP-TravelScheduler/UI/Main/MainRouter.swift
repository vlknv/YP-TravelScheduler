//
//  MainRouter.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

final class MainRouter: RouterProtocol {
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func view(for destination: MainDestination) -> some View {
        switch destination {
        case .route(let parameters):
            SelectSubjectView(
                subject: parameters.subject,
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
