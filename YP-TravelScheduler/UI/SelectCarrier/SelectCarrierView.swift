//
//  SelectCarrierView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import SwiftUI

struct SelectCarrierView: View {
    private let calendar = Calendar.autoupdatingCurrent
        
    @State private var selectedRouteIntervals: Set<RouteInterval> = []
    @State private var transferVariant: TransferVariant?

    private let route: Route = .mockRoute
    
    @State var filteredVariants: [Route.Variant] = Route.mockRoute.variants
    
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
                            NavigationLink(destination: CarrierInfoView(carrier: schedule.carrier)) {
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
                destination: RoutesFilterView(
                    selectedRouteIntervals: $selectedRouteIntervals,
                    transferVariant: $transferVariant
                ),
                label: {
                    Text("Уточнить время")
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                }
            )
            .buttonStyle(.blueRoundedButton)
            .padding(.bottom, 8)
        }
        .padding(16)
        .background(.c6White)
        .navigationTitle("")
        .onAppear {
            filteredVariants = route.variants.filter(variantFilter)
        }
    }
    
    private func variantFilter(_ variant: Route.Variant) -> Bool {
        let variantCondition = switch transferVariant {
        case .none: true
        case .with: variant.transferPoint != nil
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
