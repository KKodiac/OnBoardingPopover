//
//  IdentifiablePlace.swift
//  ShowCase
//
//  Created by Sean Hong on 2023/06/03.
//

import Foundation
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
