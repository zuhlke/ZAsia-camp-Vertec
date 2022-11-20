import EventKit
import UIKit

public struct SystemServices {
    
    public var application: Application
    public var dateProvider: DateProviding
    
    public init(application: Application, dateProvider: DateProviding) {
        self.application = application
        self.dateProvider = dateProvider
    }
    
}

public extension SystemServices {
    
    static let shared = SystemServices(
        application: UIApplication.shared,
        dateProvider: SystemDateProvider()
    )
    
}
