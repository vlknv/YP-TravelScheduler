//
//  ScheduleRequestServiceProtocol.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 09.03.2024.
//

import Foundation
import OpenAPIRuntime

protocol ScheduleRequestServiceProtocol {
    // swiftlint:disable:next function_parameter_count
    func getNearestStations(
        lat: Double,
        lng: Double,
        distance: Int,
        offset: Int?,
        limit: Int?,
        format: Format?,
        language: String?
    ) async throws -> NearestStations
    
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
    ) async throws -> StationsSchedule
    
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
    ) async throws -> StationSchedule
    
    // swiftlint:disable:next function_parameter_count
    func getDestinationStations(
        uid: String,
        form: String?,
        to: String?,
        format: Format?,
        date: String?,
        showSystems: System?
    ) async throws -> DestinationStations
    
    func getNearestSettlement(
        lat: Double,
        lng: Double,
        distance: Int?,
        lang: String?,
        format: Format?
    ) async throws -> NearestSettlement
    
    func getCarriersInfo(
        code: String,
        system: System?,
        lang: String?,
        format: Format?
    ) async throws -> Carriers
    
    func getAllAvailableStations(
        lang: String?,
        format: Format?
    ) async throws -> HTTPBody
    
    func getCopyright(
        format: Format?
    ) async throws -> Copyright
}

extension ScheduleRequestServiceProtocol {
    func getNearestStations(
        lat: Double,
        lng: Double,
        distance: Int
    ) async throws -> NearestStations {
        try await getNearestStations(
            lat: lat,
            lng: lng,
            distance: distance,
            offset: nil,
            limit: nil,
            format: .json,
            language: nil
        )
    }
    
    func getSchedule(
        from: String,
        to: String
    ) async throws -> StationsSchedule {
        try await getSchedule(
            from: from,
            to: to,
            format: .json,
            lang: nil,
            date: nil,
            transportTypes: nil,
            system: nil,
            showSystems: nil,
            offset: nil,
            limit: nil,
            addDaysMask: nil,
            resultTimezone: nil,
            transfers: nil
        )
    }
    
    func getStationSchedule(
        station: String
    ) async throws -> StationSchedule {
        try await getStationSchedule(
            station: station,
            lang: nil,
            format: .json,
            date: nil,
            transportTypes: nil,
            direction: nil,
            event: nil,
            system: nil,
            showSystems: nil,
            resultTimezone: nil
        )
    }
    
    func getDestinationStations(
        uid: String
    ) async throws -> DestinationStations {
        try await getDestinationStations(
            uid: uid,
            form: nil,
            to: nil,
            format: .json,
            date: nil,
            showSystems: .all
        )
    }
    
    func getNearestSettlement(
        lat: Double,
        lng: Double
    ) async throws -> NearestSettlement {
        try await getNearestSettlement(
            lat: lat,
            lng: lng,
            distance: nil,
            lang: nil,
            format: .json
        )
    }
    
    func getCarriersInfo(
        code: String,
        system: System
    ) async throws -> Carriers {
        try await getCarriersInfo(
            code: code,
            system: system,
            lang: nil,
            format: .json
        )
    }
    
    func getAllAvailableStations() async throws -> HTTPBody {
        try await getAllAvailableStations(
            lang: nil,
            format: .json
        )
    }
    
    func getCopyright() async throws -> Copyright {
        try await getCopyright(format: .json)
    }
}
