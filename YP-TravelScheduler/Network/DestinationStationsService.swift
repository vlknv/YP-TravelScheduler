//
//  DestinationStationsService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias DestinationStations = Components.Schemas.DestinationStations

protocol DestinationStationsServiceProtocol {
    func getDestinationStations(
        uid: String
    ) async throws -> DestinationStations
}

final class DestinationStationsService: DestinationStationsServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getDestinationStations(
        uid: String
    ) async throws -> DestinationStations {
        let response = try await client.getDestinationStations(
            query: .init(
                apikey: apiKey,
                uid: uid
            )
        )
        
        return try response.ok.body.json
    }
}
