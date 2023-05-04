//
//  BookingResponse.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation

struct BookingResponse: Codable {
    var bus_name: String?
    var id: Int?
    var time: String?
    
    enum CodingKeys: String, CodingKey {
        case bus_name = "bus_name"
        case id = "id"
        case time = "time"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bus_name = try values.decodeIfPresent(String.self, forKey: .bus_name)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        time = try values.decodeIfPresent(String.self, forKey: .time)
    }
}
