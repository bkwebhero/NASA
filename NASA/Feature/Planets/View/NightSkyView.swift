//
//  NightSkyView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import SwiftUI

struct NightSkyView: View {
    @State private var run = false
    
    private var opacity = 0.25
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack  {
                ForEach(0..<8) {_ in
                    HStack {
                        ForEach(0..<5) { _ in
                            Circle().fill(Color.white)
                                .frame(width: 3, height: 3)
                                .blur(radius: run ? 4 : 2)
                                .animation(Animation.easeInOut(duration: 6.0)
                                            .repeatForever(autoreverses: true),
                                           value: run)
                                .padding(EdgeInsets(top: self.calculateRandom(),
                                                    leading: 0,
                                                    bottom: 0,
                                                    trailing: self.calculateRandom()))
                                .onAppear() {
                                    self.run = true
                                }
                        }
                    }
                }
            }
        }
    }
    
    func calculateRandom() -> CGFloat {
        return CGFloat(Int.random(in: 30..<150))
    }
}

struct NightSkyView_Previews: PreviewProvider {
    static var previews: some View {
        NightSkyView()
    }
}
