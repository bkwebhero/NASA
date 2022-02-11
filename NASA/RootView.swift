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
                    .background(NightSkyView())
            }
            .tabItem {
                Label("POTD", systemImage: "photo.circle")
            }
            NavigationView {
                PlanetsView()
                    .background(NightSkyView())
            }
            .tabItem {
                Label("Planets", systemImage: "moon.fill")
            }
            SettingsView()
                .background(NightSkyView())
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
