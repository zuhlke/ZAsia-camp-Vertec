import Foundation

public enum StringLocalizationKey: String, CaseIterable {
    case hello_dev
    case login_screen_title
    case username_hint_text
    case password_hint_text
    case login_button_text
    case logging_loading_indicator_label
}

public enum ParameterisedStringLocalizable {
    
    enum Key: String, CaseIterable {
        case today = "today(date: %@)"
    }
    
    case today(date: Date)

    var key: Key {
        switch self {
        case .today:
            return .today
        }
    }
    
    var arguments: [CVarArg] {
        switch self {
        case .today(let date):
            return [DateFormatter.day.string(from: date)]
        }
    }
    
}
