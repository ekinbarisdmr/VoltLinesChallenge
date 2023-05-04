//
//  LinesListSection.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit

class LinesListSection {
    var type: LinesListSectionType
    var items: [Any]?
    var itemCount: Int?
    
    init(type: LinesListSectionType, items: [Any]? = nil, itemCount: Int? = nil) {
        self.type = type
        self.items = items
        self.itemCount = itemCount
    }
}
