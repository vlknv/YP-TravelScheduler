//
//  SettingsView.swift
//  YP-TravelScheduler
//
//  Created by Aleksandr Velikanov on 06.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: SettingsRouter
    
    @Binding var darkMode: Bool
    @Binding var error: NetworkError?
    
    var body: some View {
        VStack(spacing: 0) {
            darkModeSwitch
            
            userAgreement
            
            #if DEBUG
            showError
            #endif
            
            Spacer()
            
            footer
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.c6White)
    }
    
    private var darkModeSwitch: some View {
        Toggle(isOn: $darkMode) {
            Text("Тёмная тема")
        }
        .font(.system(size: 17))
        .tint(.accent)
        .frame(height: 60)
    }
    
    private var userAgreement: some View {
        Button(
            action: {
                router.push(.userAgreement)
            },
            label: {
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
        )
    }
    
    private var showError: some View {
        Button("Показать ошибку") {
            error = Bool.random() ? .serverUnavailable : .noInternet
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var footer: some View {
        Group {
            Text("Приложение использует API «Яндекс.Расписания»")
            
            Text("Версия 1.0 (beta)")
        }
        .font(.system(size: 12))
    }
}

#Preview {
    SettingsView(
        darkMode: .constant(false),
        error: .constant(nil)
    )
}
