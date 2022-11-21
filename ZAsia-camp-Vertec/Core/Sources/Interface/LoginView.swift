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
    @State var username: String = ""
    @State var password: String = ""
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                TextField(localize(.username_hint_text), text: $username)
                SecureField(localize(.password_hint_text), text: $password)
                
                Button {
                    // do nothing
                    print("\(username) and \(password)")
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
    
}
