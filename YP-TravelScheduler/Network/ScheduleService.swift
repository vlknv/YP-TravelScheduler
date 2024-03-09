//
//  ScheduleService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 08.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias StationsSchedule = Components.Schemas.StationsSchedule

protocol ScheduleServiceProtocol {
    func getSchedule(
        from: String,
        to: String
    ) async throws -> StationsSchedule
}

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getSchedule(
        from: String,
        to: String
    ) async throws -> StationsSchedule {
        let response = try await client.getSchedule(
            query: .init(
                apikey: apiKey,
                from: from,
                to: to
            )
        )
        
        return try response.ok.body.json
    }
}
