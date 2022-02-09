//
//  POTDView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import SwiftUI
import Combine

struct POTDView: View {
    
    @ObservedObject var viewModel = POTDViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                if let data = viewModel.photoOfTheDay {
                    data.title.map({Text($0)})
                    data.urlParsed.map({
                        AsyncImage(url: $0)
                            .frame(width: UIScreen.main.bounds.width)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    })
                    data.explanation.map({Text($0)})
                    data.date.map({Text($0)})
                    data.copyright.map({Text($0)})
                }
                if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.load()
        }
    }
}

struct POTDView_Previews: PreviewProvider {
    static var previews: some View {
        POTDView()
    }
}
