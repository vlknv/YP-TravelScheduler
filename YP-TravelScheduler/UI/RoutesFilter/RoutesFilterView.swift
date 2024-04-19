//
//  RoutesFilterView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import Foundation

import SwiftUI

struct RoutesFilterView {
    @Environment(\.dismiss)
    private var dismiss
    
    private let formatter = DateComponentsFormatter.hoursAndMinutes
    
    @State private var initialSelectedRouteIntervals: Set<RouteInterval>
    @State private var initialTransferVariant: TransferVariant
    
    @Binding var selectedRouteIntervals: Set<RouteInterval>
    @Binding var transferVariant: TransferVariant
    
    init(
        selectedRouteIntervals: Binding<Set<RouteInterval>>,
        transferVariant: Binding<TransferVariant>
    ) {
        self._selectedRouteIntervals = selectedRouteIntervals
        self._transferVariant = transferVariant
        
        _initialSelectedRouteIntervals = State(initialValue: selectedRouteIntervals.wrappedValue)
        _initialTransferVariant = State(initialValue: transferVariant.wrappedValue)
    }
}

extension RoutesFilterView: View {
    var body: some View {
        VStack(spacing: 16) {
            timeFiltering
            
            transferFiltering
            
            Spacer()
            
            if
                selectedRouteIntervals != initialSelectedRouteIntervals
                || transferVariant != initialTransferVariant
            {
                Button(
                    action: {
                        selectedRouteIntervals = initialSelectedRouteIntervals
                        transferVariant = initialTransferVariant
                        
                        dismiss()
                    },
                    label: {
                        Text("Применить")
                            .font(.system(size: 17, weight: .bold))
                            .frame(maxWidth: .infinity)
                    }
                )
                .buttonStyle(.blueRoundedButton)
            }
        }
        .foregroundStyle(.c7Black)
        .padding([.horizontal, .top], 16)
        .padding(.bottom, 24)
        .background(.c6White)
        .toolbarRole(.editor)
    }
    
    private var timeFiltering: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 16)
            
            ForEach(RouteInterval.allCases, id: \.self) { interval in
                HStack {
                    Text(interval.formattedInterval(using: formatter))
                        .frame(height: 60)
                    
                    Spacer()
                    
                    Image(
                        systemName: initialSelectedRouteIntervals.contains(interval)
                            ? "checkmark.square.fill"
                            : "square"
                    )
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .contentShape(.rect)
                .onTapGesture {
                    if initialSelectedRouteIntervals.contains(interval) {
                        initialSelectedRouteIntervals.remove(interval)
                    }
                    else {
                        initialSelectedRouteIntervals.insert(interval)
                    }
                }
            }
        }
    }
    
    private var transferFiltering: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 16)
            
            ForEach(TransferVariant.allCases, id: \.self) { variant in
                HStack {
                    Text(variant.rawValue)
                        .frame(height: 60)
                    
                    Spacer()
                    
                    Image(
                        systemName: variant == initialTransferVariant
                            ? "smallcircle.filled.circle"
                            : "circle"
                    )
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .contentShape(.rect)
                .onTapGesture {
                    initialTransferVariant = variant
                }
            }
        }
    }
}

#Preview {
    RoutesFilterView(
        selectedRouteIntervals: .constant([.day]),
        transferVariant: .constant(.with)
    )
}
