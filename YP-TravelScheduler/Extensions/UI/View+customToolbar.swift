//
//  View+customToolbar.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

extension View {
    func customToolbar<Router: RouterProtocol>(
        title: String? = nil,
        router: Router
    ) -> some View {
        modifier(CustomToolbarModifier(title: title, router: router))
    }
}
