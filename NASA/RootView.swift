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
            POTDView()
                .tabItem {
                    Label("POTD", systemImage: "photo.circle")
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
