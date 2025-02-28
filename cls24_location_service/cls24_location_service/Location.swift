//
//  Location.swift
//  cls24_location_service
//
//  Created by Nathapong Masathien on 16/3/24.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String // use var if would like to editable
    let description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension Location {
    
    static let baseLatitude = 12.652279341559735
    static let baseLongitude = 99.86067005767187

    static var places: [Location] = [
        Location(name: "Beach Resort", description: "Beautiful resort by the sea", latitude: baseLatitude + 0.01, longitude: baseLongitude + 0.01),
        Location(name: "Local Market", description: "Colorful local market with fresh produce", latitude: baseLatitude + 0.005, longitude: baseLongitude - 0.005),
        Location(name: "Mountain Viewpoint", description: "Scenic viewpoint overlooking the mountains", latitude: baseLatitude + 0.015, longitude: baseLongitude + 0.005),
        Location(name: "Café", description: "Cozy café with delicious coffee", latitude: baseLatitude - 0.005, longitude: baseLongitude + 0.01),
        Location(name: "Park", description: "Large park with walking trails", latitude: baseLatitude - 0.01, longitude: baseLongitude - 0.015),
        Location(name: "Shopping Mall", description: "Modern shopping mall with various shops", latitude: baseLatitude + 0.005, longitude: baseLongitude + 0.015),
        Location(name: "Historical Museum", description: "Museum showcasing local history", latitude: baseLatitude - 0.01, longitude: baseLongitude + 0.005),
        Location(name: "Art Gallery", description: "Gallery featuring local artists' works", latitude: baseLatitude - 0.005, longitude: baseLongitude - 0.01),
        Location(name: "Restaurant", description: "Fine dining restaurant with exquisite cuisine", latitude: baseLatitude + 0.015, longitude: baseLongitude - 0.005),
        Location(name: "Amusement Park", description: "Family-friendly amusement park with rides", latitude: baseLatitude - 0.015, longitude: baseLongitude + 0.01)
    ]
}
