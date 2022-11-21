//
//  LoginScreen.swift
//  UITests
//
//  Created by Eugene Tan on 21/11/22.
//  Copyright © 2022 Mo Ramezanpoor. All rights reserved.
//

import Foundation
import XCTest

struct LoginScreen {
    var app: XCUIApplication
    
    var heading: XCUIElement {
        app.staticTexts[localized: .login_screen_title]
    }

    var textFieldUserName: XCUIElement {
        app.textFields[localized: .username_hint_text]
    }
    
    var textFieldPassword: XCUIElement {
        app.secureTextFields[localized: .password_hint_text]
    }
    
    var buttonLogin: XCUIElement {
        app.buttons[localized: .login_button_text]
    }
}
