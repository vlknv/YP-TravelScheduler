//
//  WebView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 18.04.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let webView = WKWebView(frame: .zero)

    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    
    func updateUIView(
        _ uiView: WKWebView,
        context: Context
    ) {
        webView.load(
            URLRequest(url: URL(string: "https://yandex.ru/legal/practicum_offer/")!)
        )
    }
}
