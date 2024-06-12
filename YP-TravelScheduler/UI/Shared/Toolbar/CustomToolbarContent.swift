//
//  CustomToolbarContent.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 20.04.2024.
//

import SwiftUI

struct CustomToolbarContent<Router: RouterProtocol>: ToolbarContent {
    let title: String?
    let router: Router
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Button(
                action: {
                    router.pop()
                },
                label: {
                    Symbol.chevronBackward.image
                }
            )
        }
        
        if let title {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.c7Black)
            }
        }
    }
}
