//
//  LinesListPresenter.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation

class LinesListPresenter {
    
    var didListUpdated: (() -> Void)?
    var didBookedTrip: ((Int) -> Void)?
    var didFailedBookTrip: (() -> Void)?
    
    var didFetchedStationList: (([StationMapModel]) -> Void)?
    
    var sectionListSource = [LinesListSection]()
    var selectedTrips = StationMapModel()
    
    func generateTripList() {
        if let trips = selectedTrips.trips, trips.count > 0 {
            var list = [LinesListSection]()
            
            for (index, item) in trips.enumerated() {
                list.append(LinesListSection(type: .spacing, items: [4]))
                list.append(LinesListSection(type: .route, items: [
                    LineItemModel(id: item.id, lineName: item.bus_name, lineTime: item.time)]))
                
                if index < trips.count {
                    list.append(LinesListSection(type: .spacing, items: [4]))
                    list.append(LinesListSection(type: .line, items: [Constants.kEmpty]))
                }
            }
            self.sectionListSource = list
            self.didListUpdated?()
        }
    }
    
    func bookSelectedTrip(_ id: Int) {
        API.sharedManager.bookingTrip(route: selectedTrips.id ?? 0, station: id) { (response) in
            if let id = response.id, id != 0 {
                self.didBookedTrip?(id)
            }
        } errorHandler: { (error) in
            self.didFailedBookTrip?()
        }
    }
}

extension LinesListPresenter {
    func rowCount(_ section: Int) -> Int{
        let data = self.sectionListSource[section]
        if let itemCount = data.itemCount {
            return itemCount
        }else {
            return data.items?.count ?? 0
        }
    }
}
