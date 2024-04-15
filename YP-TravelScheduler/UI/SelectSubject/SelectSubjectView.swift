//
//  SelectSubjectView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import SwiftUI

struct SelectSubjectView {
    private let subject: Subject
    
    @State private var filteredItems: [Subject]

    @Binding var selectedSubjectId: UUID?
    @Binding var isActive: Bool
        
    init(
        subject: Subject,
        selectedSubjectId: Binding<UUID?>,
        isActive: Binding<Bool>
    ) {
        self.subject = subject
        self._selectedSubjectId = selectedSubjectId
        self._isActive = isActive
        
        _filteredItems = State(initialValue: subject.items)
    }
}

extension SelectSubjectView: View {
    var body: some View {
        VStack {
            SearchFieldView(
                items: subject.items,
                filteredItems: $filteredItems
            )

            ZStack {
                content
                    .opacity(filteredItems.isEmpty ? 0 : 1)
                
                Text(subject.itemsType?.notFound ?? "")
                    .font(.system(size: 24, weight: .bold))
                    .opacity(filteredItems.isEmpty ? 1 : 0)
            }
            .frame(maxHeight: .infinity)
        }
        .padding(.horizontal, 16)
        .background(.c6White)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(subject.itemsType?.title ?? "")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.c7Black)
            }
        }
        .navigationTitle("")
        .onAppear {
            if subject.items.isEmpty {
                selectedSubjectId = subject.id
                isActive = false
            }
        }
    }
    
    private var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(filteredItems) { item in
                    NavigationLink(
                        destination: SelectSubjectView(
                            subject: item,
                            selectedSubjectId: $selectedSubjectId,
                            isActive: $isActive
                        )
                    ) {
                        HStack {
                            Text(item.name)
                                .font(.system(size: 17))
                                .padding(.vertical, 19)
                            
                            Spacer()
                            
                            Symbol.chevronForward.image
                                .font(.system(size: 19))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SelectSubjectView(
        subject: .mockData,
        selectedSubjectId: .constant(UUID()),
        isActive: .constant(false)
    )
}
