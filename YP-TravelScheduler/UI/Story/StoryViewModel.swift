//
//  StoryViewModel.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import Foundation
import Combine

protocol StoryViewModelProtocol: ObservableObject {
    var currentStory: Story? { get }
    var progressViewModels: [ProgressViewModel] { get }
    
    func onAppear(startStory: Story)
    func onNext()
    func onPrevious()
    func onClose()
}

final class StoryViewModel: StoryViewModelProtocol {
    private(set) var stories: [Story] = Story.mockStories
    
    @Published private(set) var currentStory: Story?
    @Published private(set) var progressViewModels: [ProgressViewModel] = []
    
    @Published private(set) var storyCancellable: AnyCancellable?

    private var storiesToShow: [Story] = []
    
    func onAppear(startStory: Story) {
        guard let startStoryIndex = stories.firstIndex(of: startStory) else {
            return
        }
        
        storiesToShow = Array(stories.suffix(from: startStoryIndex))
        storiesToShow.append(.empty)
        
        startStoryFlow(storyToStartWithIndex: 0)
    }
    
    func onNext() {
        goTo(.next)
    }
    
    func onPrevious() {
        goTo(.previous)
    }
    
    func onClose() {
        close()
    }
}

// MARK: - Private methods

private extension StoryViewModel {
    func startStoryFlow(storyToStartWithIndex: Int) {
        guard storiesToShow.indices.contains(storyToStartWithIndex) else {
            return
        }
        
        var initialDelay = 0.0
        
        let enumeratedStoriesPublishers = storiesToShow.enumerated()
            .map { index, element in
                let storyToShowDelay = index > storyToStartWithIndex
                    ? storiesToShow.elementOrNil(at: index - 1)?.duration ?? 0
                    : 0
                
                initialDelay += storyToShowDelay
                
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
                    
                    self.currentStory = currentStory
                    
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
    
    func close() {
        storyCancellable = nil
        stories.sort(by: >)
    }
    
    func goTo(_ direction: StoriesDirection) {
        guard
            let currentStory,
            let currentStoryIndex = storiesToShow.firstIndex(of: currentStory)
        else {
            return
        }
        
        startStoryFlow(storyToStartWithIndex: currentStoryIndex + direction.rawValue)
    }
}

private extension StoryViewModel {
    enum StoriesDirection: Int {
        case next = 1
        case previous = -1
    }
}
