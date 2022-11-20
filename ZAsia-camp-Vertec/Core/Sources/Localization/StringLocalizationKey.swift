import Foundation

public enum StringLocalizationKey: String, CaseIterable {
    case hello_dev
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
