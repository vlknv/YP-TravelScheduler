//
//  RouterView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

struct RouterView<Content: View, Router: RouterProtocol> {
    @ObservedObject var router: Router
    
    private let content: Content
    
    init(
        @ViewBuilder content: () -> Content,
        router: Router
    ) {
        self.content = content()
        self.router = router
    }
}

extension RouterView: View {
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Destination.self) {
                    router.view(for: $0)
                }
        }
        .environmentObject(router)
    }
}
