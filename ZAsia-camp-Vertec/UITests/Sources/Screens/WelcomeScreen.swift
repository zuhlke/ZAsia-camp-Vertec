import Foundation
import XCTest

struct WelcomeScreen {
    var app: XCUIApplication
    
    var heading: XCUIElement {
        app.staticTexts[localized: .hello_dev]
    }
    
    func caption(for date: Date) -> XCUIElement {
        app.staticTexts[localized: .today(date: date)]
    }

}
