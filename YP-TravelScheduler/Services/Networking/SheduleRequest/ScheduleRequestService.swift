//
//  ScheduleRequestService.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

final class ScheduleRequestService: ScheduleRequestServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(
        client: Client,
        apiKey: String
    ) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // swiftlint:disable:next function_parameter_count
    func getNearestStations(
        lat: Double,
        lng: Double,
        distance: Int,
        offset: Int?,
        limit: Int?,
        format: Format?,
        language: String?
    ) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lng,
                distance: distance,
                offset: offset,
                limit: limit,
                format: format,
                lang: language
            )
        )
        
        return try response.ok.body.json
    }
    
    // swiftlint:disable:next function_parameter_count
    func getSchedule(
        from: String,
        to: String,
        format: Format?,
        lang: String?,
        date: String?,
        transportTypes: TransportTypes?,
        system: System?,
        showSystems: System?,
        offset: Int?,
        limit: Int?,
        addDaysMask: Bool?,
        resultTimezone: String?,
        transfers: Bool?
    ) async throws -> StationsSchedule {
        let response = try await client.getSchedule(
            query: .init(
                apikey: apiKey,
                from: from,
                to: to,
                format: format,
                lang: lang,
                date: date,
                transport_types: transportTypes,
                system: system,
                show_systems: showSystems,
                offset: offset,
                limit: limit,
                add_days_mask: addDaysMask,
                result_timezone: resultTimezone,
                transfers: transfers
            )
        )
        
        return try response.ok.body.json
    }
    
    // swiftlint:disable:next function_parameter_count
    func getStationSchedule(
        station: String,
        lang: String?,
        format: Format?,
        date: String?,
        transportTypes: TransportTypes?,
        direction: String?,
        event: Event?,
        system: System?,
        showSystems: System?,
        resultTimezone: String?
    ) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(
            query: .init(
                apikey: apiKey,
                station: station,
                lang: lang,
                format: format,
                date: date,
                transport_types: transportTypes,
                direction: direction,
                event: event,
                system: system,
                show_systems: showSystems,
                result_timezone: resultTimezone
            )
        )
        
        return try response.ok.body.json
    }
    
    // swiftlint:disable:next function_parameter_count
    func getDestinationStations(
        uid: String,
        form: String?,
        to: String?,
        format: Format?,
        date: String?,
        showSystems: System?
    ) async throws -> DestinationStations {
        let response = try await client.getDestinationStations(
            query: .init(
                apikey: apiKey,
                uid: uid,
                form: form,
                to: to,
                format: format,
                date: date,
                show_systems: showSystems
            )
        )
        
        return try response.ok.body.json
    }
    
    func getNearestSettlement(
        lat: Double,
        lng: Double,
        distance: Int?,
        lang: String?,
        format: Format?
    ) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lng,
                distance: distance,
                lang: lang,
                format: format
            )
        )
        
        return try response.ok.body.json
    }
    
    func getCarriersInfo(
        code: String,
        system: System?,
        lang: String?,
        format: Format?
    ) async throws -> Carriers {
        let response = try await client.getCarriersInfo(
            query: .init(
                apikey: apiKey,
                code: code,
                system: system,
                lang: lang,
                format: format
            )
        )
        
        return try response.ok.body.json
    }
    
    func getAllAvailableStations(
        lang: String?,
        format: Format?
    ) async throws -> HTTPBody {
        let response = try await client.getAllStations(
            query: .init(
                apikey: apiKey,
                lang: lang,
                format: format
            )
        )
        
        return try response.ok.body.html
    }
    
    func getCopyright(
        format: Format?
    ) async throws -> Copyright {
        let response = try await client.getCopyright(
            query: .init(
                apikey: apiKey,
                format: format
            )
        )
        
        return try response.ok.body.json
    }
}
