//
//  StoriesView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import SwiftUI

struct StoriesBlockView: View {
    @EnvironmentObject private var storiesViewModel: StoryViewModel
    
    @State private var storyToOpen: Story?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(storiesViewModel.stories) { story in
                    storyView(story)
                        .frame(width: 92, height: 140)
                }
            }
            .padding(16)
        }
        .fullScreenCover(item: $storyToOpen) { story in
            StoryView(storyToStartFrom: story).environmentObject(storiesViewModel)
        }
    }
    
    private func storyView(_ story: Story) -> some View {
        ZStack(alignment: .bottomLeading) {
            if let image = story.miniatureImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 16))
                    .opacity(story.isRead ? 0.5 : 1)
                    .onTapGesture {
                        storyToOpen = story
                    }
            }
            
            if let title = story.title {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 12)
            }
            
            if !story.isRead {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 4)
                    .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    final class PreviewViewModel: StoryViewModelProtocol {
        let currentStory: Story? = nil
        let progressViewModels: [ProgressViewModel] = []
        
        func onAppear(startStory: Story) { }
        func onNext() { }
        func onPrevious() { }
        func onClose() { }
    }
    
    return StoriesBlockView()
        .environmentObject(PreviewViewModel())
}
