// swiftlint:disable:this file_name
//
//  Binging+hashable.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 18.04.2024.
//

import SwiftUI

extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        wrappedValue.hash(into: &hasher)
    }
}

extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}
