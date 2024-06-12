//
//  MainFeatureViewModel.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 13.06.2024.
//

import Foundation

final class MainFeatureViewModel {
    
    private(set) lazy var wishlistCountries = [Country]()
    private(set) lazy var visitedCountries = [Country]()
    
    var percentageOfWorldDiscovery: Float {
        let percentage = (Float(visitedCountries.count) / 195.0 * 100.0)
        return round(percentage * 100) / 100.0
    }
    
    var seeMoreVisitedListIsHidden: Bool {
        visitedCountries.count < 4
    }
    
    var seeMoreVisitedCount: Int {
        visitedCountries.count - 3
    }
    
    var seeMoreWishlistIsHidden: Bool {
        wishlistCountries.count < 4
    }
    
    var seeMoreWishlistCount: Int {
        wishlistCountries.count - 3
    }
    
    private var mockVisited = [
        Country(title: "Peru", flag: "🇵🇪", latitude: -12.046374, longitude: -77.042793, hasVisited: false),
        Country(title: "Ukraine", flag: "🇺🇦", latitude: 49.9935, longitude: 36.2304, hasVisited: true)
    ]
    
    private var mockWishList = [
        Country(title: "Mexico", flag: "🇲🇽", latitude: 23.6345, longitude: -102.5528, hasVisited: true),
        Country(title: "Chile", flag: "🇨🇱", latitude: -31.7613, longitude: -71.3188, hasVisited: true),
        Country(title: "Italy", flag: "🇮🇹", latitude: 41.902783, longitude: 12.496366, hasVisited: false),
        Country(title: "United States of America", flag: "🇺🇸", latitude: 39.8333, longitude: -98.5855, hasVisited: false),
    ]
    
    init() {
        visitedCountries = mockVisited
        wishlistCountries = mockWishList
    }
}
