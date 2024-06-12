//
//  MainDestination.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 18.04.2024.
//

import SwiftUI

enum MainDestination: Hashable {
    case route(Route)
    case selectCarrier
    case carrierInfo(Carrier)
    case routesFilter(FilterParameters)
}

extension MainDestination {
    struct Route: Hashable {
        let selectedId: Binding<UUID?>
        let subject: Subject
    }
    
    struct FilterParameters: Hashable {
        let selectedRouteIntervals: Binding<Set<RouteInterval>>
        let transferVariant: Binding<TransferVariant>
    }
}
