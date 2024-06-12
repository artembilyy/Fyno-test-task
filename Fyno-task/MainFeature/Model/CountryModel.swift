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

    static var mockData = [
        Country(title: "Peru", flag: "🇵🇪", latitude: -12.046374, longitude: -77.042793, hasVisited: false),
        Country(title: "Ukraine", flag: "🇺🇦", latitude: 49.9935, longitude: 36.2304, hasVisited: true),
        Country(title: "Mexico", flag: "🇲🇽", latitude: 23.6345, longitude: -102.5528, hasVisited: true),
        Country(title: "Chile", flag: "🇨🇱", latitude: -31.7613, longitude: -71.3188, hasVisited: true),
        Country(title: "Italy", flag: "🇮🇹", latitude: 41.902783, longitude: 12.496366, hasVisited: false),
        Country(title: "United States of America", flag: "🇺🇸", latitude: 39.8333, longitude: -98.5855, hasVisited: false),
    ]
}
