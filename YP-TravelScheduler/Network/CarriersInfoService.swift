//
//  CarriersInfoService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Carriers = Components.Schemas.Carriers

protocol CarriersInfoServiceProtocol {
    func getCarriersInfo(
        code: String
    ) async throws -> Carriers
}

final class CarriersInfoService: CarriersInfoServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getCarriersInfo(
        code: String
    ) async throws -> Carriers {
        let response = try await client.getCarriersInfo(
            query: .init(
                apikey: apiKey,
                code: code,
                system: .iata
            )
        )
        
        return try response.ok.body.json
    }
}
