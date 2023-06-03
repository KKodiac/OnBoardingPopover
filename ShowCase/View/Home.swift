//
//  Home.swift
//  ShowCase
//
//  Created by Sean Hong on 2023/06/03.
//

import SwiftUI
import MapKit

struct Home: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        TabView {
            GeometryReader { geometry in
                let safeArea = geometry.safeAreaInsets
                
                Map(coordinateRegion: $region)
                    .overlay(alignment: .top, content: {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .frame(height: safeArea.top)
                    })
                    .ignoresSafeArea()
                    .overlay(alignment: .topTrailing) {
                        VStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.black)
                                    }
                            }
                            .showCase(order: 0,
                                      title: "Click here to get location",
                                      cornerRadius: 10,
                                      style: .continuous)
                            Spacer()
                            Button {
                            
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.red)
                                    }
                            }
                            .showCase(order: 1,
                                      title: "Click here to mark as favorite",
                                      cornerRadius: 10,
                                      style: .continuous)
                        }
                        .padding(15)
                    }
            }
            .tabItem {
                Image(systemName: "macbook.and.iphone")
                Text("Devices")
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            Text("")
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Items")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
        .overlay(alignment: .bottom, content: {
            HStack(spacing: 0) {
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45, height: 45)
                    .showCase(order: 2,
                              title: "My Devices",
                              cornerRadius: 10,
                              style: .continuous)
                    .frame(maxWidth: .infinity)
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45, height: 45)
                    .showCase(order: 3,
                              title: "Location Enalbed Tag's",
                              cornerRadius: 10,
                              style: .continuous)
                    .frame(maxWidth: .infinity)
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 45, height: 45)
                    .showCase(order: 4,
                              title: "Personal Profile",
                              cornerRadius: 10,
                              style: .continuous)
                    .frame(maxWidth: .infinity)
            }
            /// Disable user interaction
            .allowsHitTesting(false)
        })
        .modifier(ShowCaseRoot(showHighlights: true, onFinished: {
            print("Finished OnBoarding")
        }))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
