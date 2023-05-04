//
//  MapPresenter.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation
import CoreLocation

class MapPresenter {
    
    var didFetchedCoordinates: (([StationMapModel]) -> Void)?
    var didSelectedLine: ((StationMapModel) -> Void)?
    var coordinatesList = [StationMapModel]()
    
    var bookedTrip = Int()
    var bookedStation: TripItem?
    
    func fetchLinesList() {
        API.sharedManager.getStationList { (response) in
            if response.count > 0 {
                let stationList = response.map { stationItem in
                    if let selectedStation = stationItem.trips?.first(where: {$0.id == self.bookedTrip}) {
                        self.bookedStation = selectedStation
                    }
                    
                    return StationMapModel(
                        coordinates: stationItem.center_coordinates,
                        id: stationItem.id,
                        name: stationItem.name,
                        trips: stationItem.trips,
                        booked: (stationItem.trips?.first(where: {$0.id == self.bookedTrip}) != nil)
                    )
                    
                }
                self.coordinatesList = stationList
                self.didFetchedCoordinates?(stationList)
            }
        } errorHandler: { (error) in
            print(error == true ? "error" : "success")
        }
    }
    
    func didSelectedLine(_ id: Int) {
        if let selectedTrip = coordinatesList.first(where: {$0.id == id}) {
            self.didSelectedLine?(selectedTrip)
        }
    }
    
    func fetchSelectedStationCoords(_ id: Int) -> CLLocation {
        if bookedStation != nil, let bookedId = bookedStation?.id {
            if let bookedCoords = self.coordinatesList.first(where: {$0.id == bookedId})?.coordinates {
                let coordinates = bookedCoords.components(separatedBy: Constants.kComma)
                let location = CLLocation(latitude: Double(coordinates[0]) ?? 0.0, longitude: Double(coordinates[1]) ?? 0.0)
                return location
            }
        }
        return CLLocation()
    }
}
