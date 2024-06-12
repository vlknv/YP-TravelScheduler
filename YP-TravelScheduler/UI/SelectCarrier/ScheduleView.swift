//
//  ScheduleView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import SwiftUI

struct ScheduleView: View {
    let schedule: Route.Variant
    
    var body: some View {
        VStack {
            header
            
            footer
        }
        .padding(14)
        .background(.c2LightGrayUniversal)
        .frame(height: 104)
        .clipShape(.rect(cornerRadius: 12))
    }
    
    private var header: some View {
        HStack {
            Image(schedule.carrier.miniature)
                .resizable()
                .frame(width: 38, height: 38)
                .clipShape(.rect(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Text(schedule.carrier.briefTitle)
                    .font(.system(size: 17))
                    .foregroundStyle(.c3BlackUniversal)
                
                if let title = schedule.transferPoint?.title {
                    Text("С пересадкой в " + title)
                        .font(.system(size: 12))
                        .foregroundStyle(.c4RedUniversal)
                }
            }
            
            Spacer()
            
            VStack {
                Text(schedule.startDateFormatted)
                    .font(.system(size: 12))
                    .foregroundStyle(.c3BlackUniversal)
                
                Spacer()
            }
        }
    }
    
    private var footer: some View {
        HStack(spacing: 5) {
            Text(schedule.startTimeFormatted)
                .font(.system(size: 17))
                .foregroundStyle(.c3BlackUniversal)
            
            Capsule()
                .frame(height: 1)
                .foregroundStyle(.c1Gray)
            
            if let time = schedule.durationFormatted {
                Text(time)
                    .font(.system(size: 12))
                    .foregroundStyle(.c3BlackUniversal)
            }
            
            Capsule()
                .frame(height: 1)
                .foregroundStyle(.c1Gray)
            
            Text(schedule.finishTimeFormatted)
                .font(.system(size: 17))
                .foregroundStyle(.c3BlackUniversal)
        }
    }
}

#Preview {
    ScheduleView(
        schedule: .init(
            id: UUID(),
            carrier: .rzd,
            startDate: .now,
            finishDate: .now.addingTimeInterval(5.0 * 3600),
            transferPoint: .init(id: UUID(), title: "Костроме")
        )
    )
}
