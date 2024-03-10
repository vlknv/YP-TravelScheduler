//
//  ContentView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 02.03.2024.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: testService)
    }
    
    func testService() {
        do {
            let server = try Servers.server1()
            
            let client = Client(
                serverURL: server,
                transport: URLSessionTransport()
            )
            
            let service = ScheduleRequestService(
                client: client,
                apiKey: "2426d920-d760-432b-bb49-d2844a1f3dd5"
            )
            
            Task {
                do {
                    try await printNearestStations(service: service)
//                    try await printSchedule(service: service)
//                    try await printStationSchedule(service: service)
//                    try await printDestinationStations(service: service)
//                    try await printNearestSettlement(service: service)
//                    try await printCarriersInfo(service: service)
//                    try await printAllAvailableStations(service: service)
//                    try await printCopyright(service: service)
                }
                catch {
                    print(error)
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    private func printNearestStations(service: ScheduleRequestService) async throws {
        let nearestStations = try await service.getNearestStations(
            lat: 55.758,
            lng: 37.605,
            distance: 10
        )
        
        print(nearestStations)
    }
    
    private func printSchedule(service: ScheduleRequestService) async throws {
        let schedule = try await service.getSchedule(
            from: "c100",
            to: "c101"
        )
        
        print(schedule)
    }

    private func printStationSchedule(service: ScheduleRequestService) async throws {
        let stationSchedule = try await service.getStationSchedule(
            station: "s9600213"
        )
        
        print(stationSchedule)
    }
    
    private func printDestinationStations(service: ScheduleRequestService) async throws {
        let destinationStations = try await service.getDestinationStations(
            uid: "N4-1651_240524_c2543_12"
        )
        
        print(destinationStations)
    }
    
    private func printNearestSettlement(service: ScheduleRequestService) async throws {
        let nearestSettlement = try await service.getNearestSettlement(
            lat: 55.7581,
            lng: 37.6053
        )
        
        print(nearestSettlement)
    }
    
    private func printCarriersInfo(service: ScheduleRequestService) async throws {
        let carriersInfo = try await service.getCarriersInfo(
            code: "TK",
            system: .iata
        )
        
        print(carriersInfo)
    }
    
    private func printAllAvailableStations(service: ScheduleRequestService) async throws {
        let allAvailableStations = try await service.getAllAvailableStations()
        
        let allAvailableStationsData = try await Data(
            collecting: allAvailableStations, upTo: 40 * 1024 * 1024
        )
        
        print(allAvailableStationsData)
    }
    
    private func printCopyright(service: ScheduleRequestService) async throws {
        let copyright = try await service.getCopyright()
        
        print(copyright)
    }
}

#Preview {
    ContentView()
}
