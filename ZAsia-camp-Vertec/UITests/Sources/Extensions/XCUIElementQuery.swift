import Foundation
import Localization
import XCTest

extension XCUIElementQuery {
    
    subscript(localized key: StringLocalizationKey) -> XCUIElement {
        elementWithText(localize(key))
    }
    
    subscript(localized key: ParameterisedStringLocalizable) -> XCUIElement {
        elementWithText(localize(key))
    }
    
    private func elementWithText(_ string: String) -> XCUIElement {
        if string.count < 128 {
            return self[string]
        } else {
            // XCUITest can not correctly match long labels.
            return element(matching: NSPredicate(format: "label BEGINSWITH %@", String(string.prefix(128))))
        }
    }
    
}
