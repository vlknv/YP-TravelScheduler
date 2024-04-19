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

    @Binding private var path: [MainDestination]
    @Binding private var selectedSubjectId: UUID?
        
    init(
        subject: Subject,
        path: Binding<[MainDestination]>,
        selectedSubjectId: Binding<UUID?>
    ) {
        self.subject = subject
        self._path = path
        self._selectedSubjectId = selectedSubjectId
        
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
        .toolbarRole(.editor)
        .navigationTitle(subject.itemsType?.title ?? "")
        .toolbar(.hidden, for: .tabBar)
    }
    
    private var content: some View {
        ScrollView {
            LazyVStack {
                ForEach(filteredItems) { item in
                    Button(
                        action: {
                            if item.items.isEmpty {
                                selectedSubjectId = item.id
                                path.removeAll()
                            }
                            else {
                                path.append(
                                    .route(.init(selectedId: $selectedSubjectId, subject: item))
                                )
                            }
                        },
                        label: {
                            HStack {
                                Text(item.name)
                                    .font(.system(size: 17))
                                    .padding(.vertical, 19)
                                
                                Spacer()
                                
                                Symbol.chevronForward.image
                                    .font(.system(size: 19))
                            }
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    SelectSubjectView(
        subject: .mockData,
        path: .constant([]),
        selectedSubjectId: .constant(UUID())
    )
}
