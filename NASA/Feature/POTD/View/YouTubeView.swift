//
//  YouTubeView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/9/22.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: self.url))
    }

}
