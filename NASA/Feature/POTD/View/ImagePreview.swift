//
//  ImagePreview.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/9/22.
//

import SwiftUI

struct ImagePreview: View {
    
    var url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                EmptyView()
            }
        }
        
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(url: URL(string: "https://via.placeholder.com/150")!)
    }
}
