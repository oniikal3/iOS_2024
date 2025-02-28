//
//  LocationDataManager.swift
//  cls24_location_service
//
//  Created by Nathapong Masathien on 15/3/24.
//

import Foundation
import CoreLocation
import MapKit

@MainActor // To run update on main thread
@Observable class LocationDataManager: NSObject {
    // Create Singleton
    static let shared = LocationDataManager()
    
    // Published
    var currentLocation: CLLocation = CLLocation()
    var region = MKCoordinateRegion()
    
    // Internal
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization() // Authorization request
        manager.startUpdatingLocation()
    }
}

extension LocationDataManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            print("Authorized...")
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        } else {
            print("Not Authorized...")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map { newLocation in
            print("Latitude: \(newLocation.coordinate.latitude) \nLongitude: \(newLocation.coordinate.longitude)")
            currentLocation = newLocation
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        }
    }
}
