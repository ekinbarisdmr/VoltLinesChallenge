//
//  MyAnnotation.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    let identifier: Int?
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image: UIImage?
    
    init(identifier: Int? = 0, title: String? = Constants.kEmpty, subtitle: String? = Constants.kEmpty, coordinate: CLLocationCoordinate2D, image: UIImage? = UIImage()) {
        self.identifier = identifier
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.image = image
    }
}

