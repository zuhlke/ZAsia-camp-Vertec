//
//  File.swift
//  
//
//  Created by Eugene Tan on 21/11/22.
//

import Foundation
import SwiftUI

public struct LoginView: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            Text("Hi")
                .navigationTitle(Text(.login_screen_title))
        }
    }
    
}
