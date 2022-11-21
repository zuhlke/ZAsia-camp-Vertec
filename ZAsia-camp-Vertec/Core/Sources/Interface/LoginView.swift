//
//  File.swift
//  
//
//  Created by Eugene Tan on 21/11/22.
//

import Foundation
import SwiftUI
import Localization

public struct LoginView: View {
    public struct FormData {
        public var username: String
        public var password: String
    }
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isLoggingIn = false
    var logIn: (FormData) async -> Void
    
    public init(logIn: @escaping (FormData) async -> Void) {
        self.logIn = logIn
    }
    
    public var body: some View {
        NavigationView {
            List {
                TextField(localize(.username_hint_text), text: $username)
                SecureField(localize(.password_hint_text), text: $password)
                
                if isLoggingIn {
                    Text(.logging_loading_indicator_label)
                }
                
                NavigationLink {
                    Text("Here’s some help")
                } label: {
                    Text("Help")
                }

                
                Button {
                    logIn(username: username, password: password)
                } label: {
                    Text(localize(.login_button_text))
                        .frame(width: 50)
                        .background(
                            Capsule(style: .circular)
                                .strokeBorder(Color(.black), lineWidth: 1)
                                .background(
                                    Capsule(style: .circular)
                                        .fill(Color(.white))
                                )
                        )
                }
            }
    
            .navigationTitle(Text(.login_screen_title))
        }
    }
    
    func logIn(username: String, password: String) {
        Task {
            isLoggingIn = true
            await logIn(FormData(username: username, password: password))
            isLoggingIn = false
        }
    }
    
}
