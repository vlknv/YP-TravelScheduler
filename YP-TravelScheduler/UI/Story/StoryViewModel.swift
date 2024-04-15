//
//  StoryViewModel.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import Foundation
import Combine

protocol StoryViewModelProtocol: ObservableObject {
    var storyToShow: Story? { get }
    var progressViewModels: [ProgressViewModel] { get }
    
    func onAppear(startStory: Story)
    func onClose()
}

final class StoryViewModel: StoryViewModelProtocol {
    @Published private(set) var stories: [Story] = Story.mockStories
    
    @Published private(set) var storyToShow: Story?
    @Published private(set) var progressViewModels: [ProgressViewModel] = []
    
    @Published private(set) var storyCancellable: AnyCancellable?

    func onAppear(startStory: Story) {
        var initialDelay = 0.0
        
        guard let startStoryIndex = stories.firstIndex(of: startStory) else {
            return
        }
        
        var storiesToShow = Array(stories.suffix(from: startStoryIndex))
        storiesToShow.append(.empty)
        
        let enumeratedStoriesPublishers = storiesToShow.enumerated()
            .map { index, element in
                initialDelay += storiesToShow.elementOrNil(at: index - 1)?.duration ?? 0
                
                return Just((index, element))
                    .delay(for: .seconds(initialDelay), scheduler: DispatchQueue.main)
            }
        
        storyCancellable = Publishers.MergeMany(enumeratedStoriesPublishers)
            .sink(
                receiveCompletion: { [weak self] _ in
                    self?.onClose()
                },
                receiveValue: { [weak self] currentStoryIndex, currentStory in
                    guard let self else {
                        return
                    }
                    
                    storyToShow = currentStory
                    
                    if let isReadIndex = stories.firstIndex(of: currentStory) {
                        stories[isReadIndex].isRead = true
                    }
                    
                    progressViewModels = storiesToShow.enumerated()
                        .dropLast()
                        .map { index, story in
                            let state: ProgressState = switch index {
                            case ..<currentStoryIndex: .filled
                            case currentStoryIndex: .isFilling(duration: story.duration)
                            default: .empty
                            }
                            
                            return ProgressViewModel(state: state)
                        }
                }
            )
    }
    
    func onClose() {
        storyCancellable = nil
        stories.sort(by: >)
    }
}
