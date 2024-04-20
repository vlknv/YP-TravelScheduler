//
//  CustomToolbarModifier.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

struct CustomToolbarModifier<Router: RouterProtocol>: ViewModifier {
    let title: String?
    let router: Router
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                CustomToolbarContent(
                    title: title,
                    router: router
                )
            }
            .navigationBarBackButtonHidden(true)
    }
}
