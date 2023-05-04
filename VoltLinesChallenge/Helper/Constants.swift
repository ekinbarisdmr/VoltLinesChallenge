//
//  Constants.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit
import Foundation

class Constants {
    static let kEmpty = ""
    static let kComma = ","
    static let kBook = "Book"
    static let kRoutes = "Routes"
    static let kListTrips = "List Trips"
    static let kTripInfo = "%@ Trips"
    static let kUserMarker = "userMarker"
    static let kBookedMarker = "bookedMarker"
    static let kDefaultMarker = "defaultMarker"
    static let kAlertTitle = "The trip you selected is full."
    static let kAlertDesc = "Please selected another one."
    static let kAlertBtn = "Select a Trip"
    
    static let stationListEndpoint = "https://demo.voltlines.com/case-study/6/stations"
    static let checkBookEndpoint = "https://demo.voltlines.com/case-study/6/stations/%@/trips/%@"
}

