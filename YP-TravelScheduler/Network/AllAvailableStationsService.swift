//
//  AllAvailableStationsService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Stations = Components.Schemas.StationsList

protocol AllAvailableStationsServiceProtocol {
    func getAllAvailableStations() async throws -> HTTPBody
}

final class AllAvailableStationsService: AllAvailableStationsServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getAllAvailableStations() async throws -> HTTPBody {
        let response = try await client.getAllStations(
            query: .init(
                apikey: apiKey
            )
        )
        
        return try response.ok.body.html
    }
}
