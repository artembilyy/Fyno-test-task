//
//  MainFeatureViewModel.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 13.06.2024.
//

import Foundation

final class MainFeatureViewModel {

    enum DropDownState {
        case hidden
        case expanded
    }

    private(set) lazy var bucketlistCountries = [Country]()
    private(set) lazy var visitedCountries = [Country]()

    private(set) var visitedSeeMoreState = DropDownState.hidden
    private(set) var bucketlistSeeMoreState = DropDownState.hidden

    var percentageOfWorldDiscovery: Float {
        let percentage = (Float(visitedCountries.count) / 195.0 * 100.0)
        return round(percentage * 100) / 100.0
    }

    var seeMoreVisitedListIsHidden: Bool {
        visitedCountries.count < 4
    }

    var seeMoreBucketlistIsHidden: Bool {
        bucketlistCountries.count < 4
    }

    var seeMoreVisitedCount: Int {
        visitedCountries.count - 3
    }

    var seeMoreWishlistCount: Int {
        bucketlistCountries.count - 3
    }

    var dataSourceVisitedCountiesCount: Int {
        if visitedSeeMoreState == .hidden {
            return visitedCountries.prefix(3).count
        } else {
            return visitedCountries.count
        }
    }

    var dataSourceWishlistCountiesCount: Int {
        if bucketlistSeeMoreState == .hidden {
            return bucketlistCountries.prefix(3).count
        } else {
            return bucketlistCountries.count
        }
    }

    init() {
        for country in mockData {
            if country.hasVisited {
                visitedCountries.append(country)
            } else {
                bucketlistCountries.append(country)
            }
        }
    }

    func visitedDropDownToogle() {
        visitedSeeMoreState = (visitedSeeMoreState == .hidden ? .expanded : .hidden)
    }

    func bucketListDropDownToogle() {
        bucketlistSeeMoreState = (bucketlistSeeMoreState == .hidden ? .expanded : .hidden)
    }
}

extension MainFeatureViewModel {
    private var mockData: [Country] {
        [Country(title: "Peru", flag: "🇵🇪", latitude: -12.046374, longitude: -77.042793, hasVisited: false),
         Country(title: "Ukraine", flag: "🇺🇦", latitude: 49.9935, longitude: 36.2304, hasVisited: true),
         Country(title: "Mexico", flag: "🇲🇽", latitude: 23.6345, longitude: -102.5528, hasVisited: true),
         Country(title: "Chile", flag: "🇨🇱", latitude: -31.7613, longitude: -71.3188, hasVisited: true),
         Country(title: "Italy", flag: "🇮🇹", latitude: 41.902783, longitude: 12.496366, hasVisited: false),
         Country(title: "United States of America", flag: "🇺🇸", latitude: 39.8333, longitude: -98.5855, hasVisited: false),
         Country(title: "Brazil", flag: "🇧🇷", latitude: -14.2350, longitude: -51.9253, hasVisited: false),
         Country(title: "Japan", flag: "🇯🇵", latitude: 36.2048, longitude: 138.2529, hasVisited: true),
         Country(title: "Australia", flag: "🇦🇺", latitude: -25.2744, longitude: 133.7751, hasVisited: false),
         Country(title: "Egypt", flag: "🇪🇬", latitude: 26.8206, longitude: 30.8025, hasVisited: true),
         Country(title: "India", flag: "🇮🇳", latitude: 20.5937, longitude: 78.9629, hasVisited: false),
         Country(title: "Canada", flag: "🇨🇦", latitude: 56.1304, longitude: -106.3468, hasVisited: false),
         Country(title: "South Africa", flag: "🇿🇦", latitude: -30.5595, longitude: 22.9375, hasVisited: false),
         Country(title: "Spain", flag: "🇪🇸", latitude: 40.4637, longitude: -3.7492, hasVisited: true),
         Country(title: "New Zealand", flag: "🇳🇿", latitude: -40.9006, longitude: 174.8860, hasVisited: false)]
    }
}
