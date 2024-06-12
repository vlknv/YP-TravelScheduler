//
//  RouterProtocol.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 19.04.2024.
//

import SwiftUI

protocol RouterProtocol: ObservableObject {
    associatedtype Destination: Hashable
    associatedtype Content: View
    
    var path: NavigationPath { get set }
     
    func view(for destination: Destination) -> Content
    func push(_ destination: Destination)
    func pop()
    func popToRoot()
}

extension RouterProtocol {
    func push(_ destination: Destination) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
