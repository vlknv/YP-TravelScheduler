//
//  NearestSettlementService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestSettlement = Components.Schemas.NearestSettlement

protocol NearestSettlementServiceProtocol {
    func getNearestSettlement(
        lat: Double,
        lng: Double
    ) async throws -> NearestSettlement
}

final class NearestSettlementService: NearestSettlementServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getNearestSettlement(
        lat: Double,
        lng: Double
    ) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lng
            )
        )
        
        return try response.ok.body.json
    }
}
