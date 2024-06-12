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
            date: Date.now.addingTimeInterval(8),
            miniatureImage: .storyPreview1,
            fullscreenImage: .storyFull11,
            title: "Text1",
            details: "Text1 Text1 Text1 Text1",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(7),
            miniatureImage: .storyPreview2,
            fullscreenImage: .storyFull21,
            title: "Text2",
            details: "Text2 Text2 Text2 Text2",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(6),
            miniatureImage: .storyPreview3,
            fullscreenImage: .storyFull31,
            title: "Text3",
            details: "Text3 Text3 Text3 Text3",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(5),
            miniatureImage: .storyPreview4,
            fullscreenImage: .storyFull41,
            title: "Text4",
            details: "Text4 Text4 Text4 Text4",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(4),
            miniatureImage: .storyPreview5,
            fullscreenImage: .storyFull51,
            title: "Text5",
            details: "Text5 Text5 Text5 Text5",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(3),
            miniatureImage: .storyPreview6,
            fullscreenImage: .storyFull61,
            title: "Text6",
            details: "Text6 Text6 Text6 Text6",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(2),
            miniatureImage: .storyPreview7,
            fullscreenImage: .storyFull71,
            title: "Text7",
            details: "Text7 Text7 Text7 Text7",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(1),
            miniatureImage: .storyPreview8,
            fullscreenImage: .storyFull81,
            title: "Text8",
            details: "Text8 Text8 Text8 Text8",
            isRead: false,
            duration: 5
        ),
        .init(
            id: UUID(),
            date: Date.now.addingTimeInterval(0),
            miniatureImage: .storyPreview9,
            fullscreenImage: .storyFull91,
            title: "Text9",
            details: "Text9 Text9 Text9 Text9",
            isRead: false,
            duration: 5
        ),
    ]
    .sorted(by: >)
}
