//
//  CountryModel.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import MapKit

final class Country: NSObject, MKAnnotation {
    let title: String?
    let flag: String
    let coordinate: CLLocationCoordinate2D
    let hasVisited: Bool

    init(
        title: String,
        flag: String,
        latitude: Double,
        longitude: Double,
        hasVisited: Bool = false
    ) {
        self.title = title
        self.flag = flag
        self.hasVisited = hasVisited
        coordinate = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(floatLiteral: latitude),
            longitude: CLLocationDegrees(floatLiteral: longitude)
        )
    }
}
