//
//  Story.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import Foundation

struct Story: Identifiable {
    let id: UUID
    
    let date: Date
    let miniatureImage: ImageResource?
    let fullscreenImage: ImageResource?
    let title: String?
    let details: String?
    var isRead: Bool
    let duration: TimeInterval
}

extension Story: Comparable {
    static func < (lhs: Story, rhs: Story) -> Bool {
        lhs.isRead == rhs.isRead ? lhs.date < rhs.date : lhs.isRead
    }
}

extension Story {
    static let empty: Self = .init(
        id: UUID(),
        date: Date.distantPast,
        miniatureImage: nil,
        fullscreenImage: nil,
        title: nil,
        details: nil,
        isRead: false,
        duration: 0
    )
    
    static var mockStories: [Story] = [
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(4),
            miniatureImage: .storyMiniature1,
            fullscreenImage: .storyFull1,
            title: "Text1",
            details: "Text Text1 Text1 Text1",
            isRead: false,
            duration: 2
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(3),
            miniatureImage: .storyMiniature2,
            fullscreenImage: .storyFull2,
            title: "Text2",
            details: "Text2 Text2 Text2 Text2",
            isRead: false,
            duration: 2
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(2),
            miniatureImage: .storyMiniature3,
            fullscreenImage: .storyFull3,
            title: "Text3",
            details: "Text3 Text3 Text3 Text3",
            isRead: false,
            duration: 2
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(1),
            miniatureImage: .storyMiniature4,
            fullscreenImage: .storyFull4,
            title: "Text4",
            details: "Text4 Text4 Text4 Text4",
            isRead: false,
            duration: 2
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(0),
            miniatureImage: .storyMiniature5,
            fullscreenImage: .storyFull5,
            title: "Text5",
            details: "Text5 Text5 Text5 Text5",
            isRead: false,
            duration: 2
        ),
    ]
    .sorted(by: >)
}
