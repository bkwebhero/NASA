//
//  SolarSystemView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import SwiftUI

struct SolarSystemView: View {
    
    @ObservedObject var viewModel = SolarSystemViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    ForEach(viewModel.sorted, id: \.id) { planet in
                        CelestialBodyView(celestialBody: planet)
                            .padding()
                            .background(Color.primary.opacity(0.1))
                            .cornerRadius(24)
                            .frame(maxWidth: UIScreen.main.bounds.width - 48)
                    }
                }
                .padding([.leading, .trailing])
                Spacer()
            }
        }
        .background(NightSkyView())
        .onAppear {
            viewModel.load()
        }
        .navigationTitle("Our Planets")
    }
}

struct SolarSystemView_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystemView()
    }
}
