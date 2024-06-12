//
//  SearchFieldView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 14.04.2024.
//

import SwiftUI

struct SearchFieldView<Item>: View where Item: Named {
    @State private var text: String = ""

    let items: [Item]
    @Binding var filteredItems: [Item]
        
    var body: some View {
        HStack {
            Symbol.magnifyingglass.image
                .foregroundStyle(.c1Gray)
                .frame(height: 25)
            
            TextField("Введите запрос", text: $text)
            
            Spacer()
            
            if !text.isEmpty {
                Button(
                    action: {
                        text = ""
                    },
                    label: {
                        Symbol.xmarkCircleFill.image
                            .foregroundStyle(.c1Gray)
                    }
                )
            }
        }
        .font(.system(size: 17))
        .padding(7)
        .background(.c8LightGray)
        .clipShape(.rect(cornerRadius: 10))
        .onChange(of: text) { _ in
            if text.isEmpty {
                filteredItems = items
            }
            else {
                filteredItems = items.filter {
                    $0.name.lowercased().contains(text.lowercased())
                }
            }
        }
    }
}
