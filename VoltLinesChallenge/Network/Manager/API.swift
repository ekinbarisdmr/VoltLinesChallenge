//
//  API.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation
import Alamofire

class API {
    
    static let sharedManager = API()
    private var sessionManager = Session()
    private init() { }
    
    
    fileprivate let encoding = JSONEncoding.default
    
    func getStationList(success: @escaping ((_ status: [StationItem])-> Void), errorHandler: @escaping ((_ status: Bool)-> Void)){
        
        let endpoint = Constants.stationListEndpoint
        sessionManager.request(endpoint, method: .get, encoding: JSONEncoding.default).responseData { (response) in
            let result = response.result
            switch result {
            case .success(let data):
                do {
                    let responseArray = try JSONDecoder().decode([StationItem].self, from: data)
                    success(responseArray)
                } catch  {
                    errorHandler(true)
                }
            case .failure(_ ):
                errorHandler(true)
            }
        }
    }
    
    func bookingTrip(route: Int, station: Int, success: @escaping ((_ status: BookingResponse)-> Void), errorHandler: @escaping ((_ status: Bool)-> Void)){
        
        let endpoint = "https://demo.voltlines.com/case-study/6/stations/\(route)/trips/\(station)"
        sessionManager.request(endpoint, method: .post, encoding: JSONEncoding.default).responseData { (response) in
            let result = response.result
            switch result {
            case .success(let data):
                do {
                    let responseArray = try JSONDecoder().decode(BookingResponse.self, from: data)
                    success(responseArray)
                } catch  {
                    errorHandler(true)
                }
            case .failure(_ ):
                errorHandler(true)
            }
        }
    }
}

