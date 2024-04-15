//
//  SettingsView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI
import WebKit

struct SettingsView: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle(isOn: $darkMode) {
                Text("Тёмная тема")
            }
            .font(.system(size: 17))
            .tint(.accent)
            .frame(height: 60)
            
            NavigationLink(
                destination: WebView()
                    .background(.c6White)
                    .navigationTitle("Пользовательское соглашение")
            ) {
                HStack {
                    Text("Пользовательское соглашение")
                        .font(.system(size: 17))
                        .padding(.vertical, 19)
                    
                    Spacer()
                    
                    Symbol.chevronForward.image
                        .font(.system(size: 19))
                }
                .frame(height: 60)
            }
            
            Spacer()
            
            Group {
                Text("Приложение использует API «Яндекс.Расписания»")
                
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.c6White)
    }
}

#Preview {
    SettingsView(darkMode: .constant(false))
}

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
