//
//  RouteView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import SwiftUI

struct RouteView: View {
    private let subject: Subject = .mockData
    
    @Binding var fromStationId: UUID?
    @Binding var toStationId: UUID?
    
    var body: some View {
        HStack(spacing: 16) {
            routePoints
            
            switchButton
        }
        .padding(16)
        .background(.accent)
        .clipShape(.rect(cornerRadius: 20))
        .padding(.horizontal, 16)
    }
    
    private var routePoints: some View {
        VStack(alignment: .leading, spacing: 28) {
            navigationLink(
                name: "Откуда",
                parameters: .init(selectedId: $fromStationId, subject: subject)
            )
            
            navigationLink(
                name: "Куда",
                parameters: .init(selectedId: $toStationId, subject: subject)
            )
        }
        .lineLimit(1)
        .font(.system(size: 17))
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
    }
    
    private var switchButton: some View {
        Button(
            action: {
                (fromStationId, toStationId) = (toStationId, fromStationId)
            },
            label: {
                Image(.switch)
            }
        )
        .foregroundStyle(.accent)
        .frame(width: 24, height: 24)
        .padding(6)
        .background(.white)
        .clipShape(.circle)
    }
    
    private func navigationLink(
        name: String,
        parameters: MainDestination.Route
    ) -> some View {
        NavigationLink(value: MainDestination.route(parameters)) {
            if let id = parameters.selectedId.wrappedValue {
                Text(subject.getRouteNameBy(id: id) ?? "")
                    .foregroundStyle(.c3BlackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            else {
                Text(name)
                    .foregroundStyle(.c1Gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    RouteView(
        fromStationId: .constant(UUID()),
        toStationId: .constant(UUID())
    )
}
