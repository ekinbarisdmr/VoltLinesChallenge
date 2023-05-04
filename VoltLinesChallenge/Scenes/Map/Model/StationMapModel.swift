//
//  StationMapModel.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation

struct StationMapModel {
    var coordinates: String?
    var id: Int?
    var name: String?
    var trips: [TripItem]?
    var booked: Bool?
    
    var tripInfo: String {
        let tripCount = trips?.count.string ?? Constants.kEmpty
        return tripCount == Constants.kEmpty ? Constants.kEmpty : String(format: Constants.kTripInfo, tripCount)
    }
}
