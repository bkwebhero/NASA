//
//  POTDView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import SwiftUI

struct POTDView: View {
    var body: some View {
        Image(systemName: "photo.circle")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
    }
}

struct POTDView_Previews: PreviewProvider {
    static var previews: some View {
        POTDView()
    }
}
