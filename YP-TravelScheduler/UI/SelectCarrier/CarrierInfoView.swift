//
//  CarrierInfoView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.04.2024.
//

import SwiftUI

struct CarrierInfoView: View {
    let carrier: Carrier
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let logo = carrier.logo {
                Image(logo)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 24))
            }
            
            Text(carrier.fullTitle)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.c7Black)
            
            detailsView(.email(carrier.email ?? ""))
            
            detailsView(.phone(carrier.phone ?? ""))
            
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.c6White)
        .navigationTitle("Информация о перевозчике")
        .toolbarRole(.editor)
    }
    
    private func detailsView(_ contact: Contact) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(contact.name)
                .font(.system(size: 17))
                .foregroundStyle(.c7Black)
            
            Text(contact.content)
                .font(.system(size: 12))
                .foregroundStyle(.c5BlueUniveral)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CarrierInfoView(carrier: .rzd)
}
