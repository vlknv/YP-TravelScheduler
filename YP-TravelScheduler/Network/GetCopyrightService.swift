//
//  GetCopyrightService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.Copyright

protocol GetCopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}

final class GetCopyrightService: GetCopyrightServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(
            query: .init(
                apikey: apiKey
            )
        )
        
        return try response.ok.body.json
    }
}
