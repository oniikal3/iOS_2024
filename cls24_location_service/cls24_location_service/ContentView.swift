//
//  ContentView.swift
//  cls24_location_service
//
//  Created by Nathapong Masathien on 15/3/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var locationManager = LocationDataManager.shared
    @State var position: MapCameraPosition = .automatic

    var body: some View {
//        Map(initialPosition: .region(locationManager.region)) {
//            Annotation("Some place", coordinate: locationManager.region.center) {
//                Image(systemName: "heart.circle")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .symbolEffect(.variableColor)
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.pink.opacity(0.7))
//                    .clipShape(Circle())
//            }
//        }
//        .mapStyle(.standard(elevation: .realistic))
        
        Map(position: $position) {
            Marker("User location", systemImage: "figure.wave", coordinate: locationManager.region.center)
        }
        .onMapCameraChange {
            withAnimation {
                position = .camera(MapCamera(centerCoordinate: locationManager.region.center, distance: 1000))
//                position = .region(locationManager.region)
            }
        }
        .onAppear {
//            position = .region(locationManager.region)
            position = .camera(MapCamera(centerCoordinate: locationManager.region.center, distance: 1000))
        }
        
//        Map(initialPosition: .userLocation(fallback: .region(locationManager.region)))
        
//        Map {
//            Annotation("Parking", coordinate: locationManager.region.center) {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(.background)
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(.secondary, lineWidth: 5)
//                    Image(systemName: "car")
//                        .padding(5)
//                }
//            }
//            .annotationTitles(.hidden)
//            
////            MapPolyline(coordinates: [.parking, locationManager.region.center])
////                .stroke(.blue, lineWidth: 15)
//        }
//        .mapStyle(.standard(elevation: .realistic))
//        .mapControls {
//            MapUserLocationButton()
//            MapCompass()
//            MapScaleView()
//        }
        
    }
}

#Preview {
    return ContentView()
}

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(
        latitude: 42.354528, longitude: -71.068369
    )
}

extension MKCoordinateRegion {
    static let boston = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.360256, longitude: -71.057279),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    static let northShore = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.547408, longitude: -70.870085),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
}
