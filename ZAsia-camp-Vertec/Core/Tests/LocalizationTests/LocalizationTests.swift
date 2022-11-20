import XCTest
@testable import Localization

class LocalizationTests: XCTestCase {
    
    func testAllLocalizationKeysHaveValue() {
        StringLocalizationKey.allCases.forEach {
            XCTAssert(Localization.hasLocalizedValue(for: $0), "No localized value for “\($0.rawValue)”")
        }
        ParameterisedStringLocalizable.Key.allCases.forEach {
            XCTAssert(Localization.hasLocalizedValue(for: $0), "No localized value for “\($0.rawValue)”")
        }
    }
    
}
