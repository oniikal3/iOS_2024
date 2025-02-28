//
//  MapView.swift
//  cls24_location_service
//
//  Created by Nathapong Masathien on 16/3/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var locationManager = LocationDataManager.shared
    @State private var position: MapCameraPosition = .automatic
    @State private var selection: MapFeature?
    
    @State private var locations = Location.places//[Location]()
    @State private var selectedPlace: Location?
    
    var body: some View {
        MapReader { proxy in
            Map(position: $position,
                selection: $selection)
            {
                Annotation("User current location", coordinate: locationManager.region.center) {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .symbolEffect(.variableColor)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.pink.opacity(0.7))
                        .clipShape(Circle())
                }
                
                ForEach(locations) { location in
//                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                    
                }
            }
//            .onTapGesture { position in
//                if let coordinate = proxy.convert(position, from: .local) {
//                    print("Tapped at \(coordinate)")
//                    let newLocation = Location(name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
//                    locations.append(newLocation)
//                    
//                }
//            }
            .mapFeatureSelectionDisabled { _ in
                false
            }
            .mapFeatureSelectionContent { feature in
                //                Marker(feature.title ?? "", coordinate: feature.coordinate)
            }
            
        }
        .sheet(item: $selectedPlace) { place in
            Text(place.name)
        }
    }
}

#Preview {
    MapView()
}
