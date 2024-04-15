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
            
            controls
                .padding(.horizontal, 12)
        }
        .onAppear { viewModel.onAppear(startStory: storyToStartFrom) }
        .onChange(of: viewModel.storyCancellable) { value in
            if value == nil {
                dismiss()
            }
        }
    }
    
    private var content: some View {
        ZStack {
            if let image = viewModel.storyToShow?.fullscreenImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 40))
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                
                if let title = viewModel.storyToShow?.title {
                    Text(title)
                        .font(.system(size: 34, weight: .bold))
                }
                
                if let details = viewModel.storyToShow?.details {
                    Text(details)
                        .font(.system(size: 20))
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 40)
            .padding(.horizontal, 16)
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
