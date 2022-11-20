import Foundation

public enum Localization {
    static func localize<Key: RawRepresentable>(_ key: Key, default value: String = "") -> String where Key.RawValue == String {
        NSLocalizedString(key.rawValue, tableName: nil, bundle: .module, value: value, comment: "")
    }
}

extension Localization {
    static func hasLocalizedValue<Key: RawRepresentable>(for key: Key) -> Bool where Key.RawValue == String {
        localize(key, default: "1") == localize(key, default: "2")
    }
}

public func localize(_ key: StringLocalizationKey) -> String {
    Localization.localize(key)
}

public func localize(_ localizable: ParameterisedStringLocalizable) -> String {
    let format = Localization.localize(localizable.key)
    return String(format: format, arguments: localizable.arguments)
}
