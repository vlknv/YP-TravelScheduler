//
//  SelectCarrierView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import SwiftUI

struct SelectCarrierView: View {
    private let route: Route = .mockRoute

    @State private var selectedRouteIntervals: Set<RouteInterval> = []
    @State private var transferVariant: TransferVariant = .with
    @State private var filteredVariants: [Route.Variant] = []
    
    var body: some View {
        VStack {
            Text("\(route.startPoint.title) \(Symbol.arrowForward.image) \(route.finishPoint.title)")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.c7Black)
                .padding(.bottom, 16)
            
            if !filteredVariants.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(filteredVariants) { schedule in
                            NavigationLink(
                                value: MainDestination.carrierInfo(schedule.carrier)
                            ) {
                                ScheduleView(schedule: schedule)
                            }
                        }
                    }
                }
            }
            else {
                Spacer()
                
                Text("Вариантов нет")
                    .font(.system(size: 24, weight: .bold))
            }
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            NavigationLink(
                value: MainDestination.routesFilter(
                    .init(
                        selectedRouteIntervals: $selectedRouteIntervals,
                        transferVariant: $transferVariant
                    )
                )
            ) {
                Text("Уточнить время")
                    .font(.system(size: 17, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
            }
            .buttonStyle(.blueRoundedButton)
            .padding(.bottom, 8)
        }
        .padding(16)
        .background(.c6White)
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            filteredVariants = route.variants.filter(variantFilter)
        }
    }
    
    private func variantFilter(_ variant: Route.Variant) -> Bool {
        let variantCondition = switch transferVariant {
        case .with: true
        case .without: variant.transferPoint == nil
        }
        
        let intervalsCondition = if !selectedRouteIntervals.isEmpty {
            selectedRouteIntervals.contains { interval in
                guard
                    let startDate = interval.start.hour,
                    var finishDate = interval.finish.hour
                else {
                    return false
                }
                
                finishDate += finishDate == 0 ? 24 : 0
                
                return startDate <= variant.startDate.component(.hour)
                && variant.startDate.component(.hour) <= finishDate
            }
        }
        else {
            true
        }
                        
        return variantCondition && intervalsCondition
    }
}

#Preview {
    SelectCarrierView()
}
