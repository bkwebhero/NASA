//
//  RootView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationView {
                POTDView()
            }
            .tabItem {
                Label("POTD", systemImage: "photo.circle")
            }
            NavigationView {
                SolarSystemView()
            }
            .tabItem {
                Label("Solar System", systemImage: "moon.fill")
            }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "list.dash")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
