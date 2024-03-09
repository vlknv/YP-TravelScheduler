//
//  StationScheduleService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias StationSchedule = Components.Schemas.StationSchedule

protocol StationScheduleServiceProtocol {
    func getStationSchedule(
        station: String
    ) async throws -> StationSchedule
}

final class StationScheduleService: StationScheduleServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getStationSchedule(
        station: String
    ) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(
            query: .init(
                apikey: apiKey,
                station: station
            )
        )
        
        return try response.ok.body.json
    }
}
