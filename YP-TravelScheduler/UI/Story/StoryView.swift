//
//  StoryView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 07.04.2024.
//

import SwiftUI

struct StoryView {
    @Environment(\.dismiss)
    private var dismiss
    
    @EnvironmentObject private var viewModel: StoryViewModel
    
    private let storyToStartFrom: Story
    
    init(storyToStartFrom: Story) {
        self.storyToStartFrom = storyToStartFrom
    }
}

extension StoryView: View {
    var body: some View {
        ZStack {
            Color.c3BlackUniversal
                .ignoresSafeArea()
            
            content
            
            actions
            
            controls
                .padding(.horizontal, 12)
        }
        .onAppear { viewModel.onAppear(startStory: storyToStartFrom) }
        .onChange(of: viewModel.storyCancellable) { value in
            if value == nil {
                dismiss()
            }
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < 0 {
                        viewModel.onNext()
                    }
                    
                    if value.translation.width > 0 {
                        viewModel.onPrevious()
                    }
                    
                    if value.translation.height > 0 {
                        viewModel.onClose()
                    }
                }
        )
    }
    
    private var content: some View {
        ZStack {
            if let image = viewModel.currentStory?.fullscreenImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 40))
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                
                if let title = viewModel.currentStory?.title {
                    Text(title)
                        .font(.system(size: 34, weight: .bold))
                }
                
                if let details = viewModel.currentStory?.details {
                    Text(details)
                        .font(.system(size: 20))
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 40)
            .padding(.horizontal, 16)
        }
        .animation(.linear(duration: 0.1), value: viewModel.currentStory)
    }
    
    private var actions: some View {
        HStack(spacing: 0) {
            Color.white
                .opacity(0.001)
                .onTapGesture(perform: viewModel.onPrevious)
            
            Color.white
                .opacity(0.001)
                .onTapGesture(perform: viewModel.onNext)
        }
    }
    
    private var controls: some View {
        VStack(spacing: 16) {
            HStack(spacing: 6) {
                ForEach(viewModel.progressViewModels) {
                    ProgressView(viewModel: $0)
                }
            }
            .padding(.top, 35)
            
            HStack {
                Spacer()
                
                Button(
                    action: {
                        viewModel.onClose()
                    },
                    label: {
                        Symbol.xmarkCircleFill.image
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .c3BlackUniversal)
                            .frame(width: 30, height: 30)
                    }
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    StoryView(storyToStartFrom: .mockStories[0])
}
