//
//  POTDView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import SwiftUI
import Combine

struct POTDView: View {
    
    @State var loaded: Bool = false
    @ObservedObject var viewModel = POTDViewModel()
    private var horizontalPadding: CGFloat = 16
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 16) {
                
                // If there is data, display it
                if let _ = viewModel.photoOfTheDay {
                    
                    // Show the title if it exists
                    viewModel.title.map({Text($0).font(.title)})
                    
                    // Show a date picker
                    DatePicker(selection: $viewModel.selectedDate, in: ...Date(), displayedComponents: .date) {
                        Text("Date:")
                    }
                    // Need to set zIndex due to SwiftUI bug where date picker is sometimes not tappable
                    // zIndex brings to the front of the view
                    .zIndex(1)
                    
                    // If we have a URL, need to know if it is a photo or a video
                    if let url = viewModel.url {
                        
                        // If it is a video, load it in an embedded webview
                        if viewModel.isVideo {
                            YouTubeView(url: url)
                                .frame(width: UIScreen.main.bounds.width - (horizontalPadding * 2),
                                       height: UIScreen.main.bounds.height * 0.3)
                                .cornerRadius(12)
                            
                        // If it is an image, load it asynchronously
                        } else {
                            NavigationLink(destination: ImagePreview(url: url)) {
                                ZStack {
                                    AsyncImage(url: url)
                                        .frame(width: UIScreen.main.bounds.width - (horizontalPadding * 2),
                                               height: UIScreen.main.bounds.height * 0.3)
                                        .cornerRadius(12)
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                                                .resizable()
                                                .padding()
                                                .frame(width: 50, height: 50)
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundColor(.white)
                                                .background(.black)
                                                .opacity(0.8)
                                                .cornerRadius(12)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    
                    // Show explanation and copyright holder if applicable
                    viewModel.explanation.map({Text($0).font(.body)})
                    viewModel.copyright.map({Text($0).font(.footnote)})
                    
                // If there is no data and an error, show the error
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
        .onAppear {
            // On first appearance, load data
            guard !loaded else { return }
            loaded = true
            viewModel.load()
        }
        .onChange(of: viewModel.selectedDate) { _ in
            // On changing the selected date, load data
            viewModel.load()
        }
        // Update navigation bar title with selected date
        .navigationTitle(viewModel.selectedDate.toFriendlyString())
    }
}

struct POTDView_Previews: PreviewProvider {
    static var previews: some View {
        POTDView()
    }
}
