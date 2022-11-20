import Localization
import SwiftUI

extension Text {
    
    init(_ key: StringLocalizationKey) {
        self.init(verbatim: localize(key))
    }
    
    init(_ key: ParameterisedStringLocalizable) {
        self.init(verbatim: localize(key))
    }
    
}
